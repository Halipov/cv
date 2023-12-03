import 'package:auto_route/auto_route.dart';
import 'package:cv/features/common/widgets/di_scope/app_scope.dart';
import 'package:cv/features/navigation/router.dart';
import 'package:cv/features/weather/bloc/weather_bloc.dart';
import 'package:cv/features/weather/di/_di_storages.dart';
import 'package:cv/features/weather/domain/_domain.dart';
import 'package:cv/features/weather/ui/widgets/_widgets.dart';
import 'package:cv/util/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class WeatherScreen extends StatefulWidget implements AutoRouteWrapper {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();

  @override
  Widget wrappedRoute(BuildContext context) => WeatherServiceScope(
        create: (context) => WeatherServiceStorage(
          dio: AppScope.of(context).dio,
        ),
        child: WeatherRepositoryScope(
          create: (context) => WeatherRepositoryStorage(
            weatherService: WeatherServiceScope.of(context).weatherService,
          ),
          child: BlocProvider<WeatherBloc>(
            create: (context) => WeatherBloc(
              weatherRepository:
                  WeatherRepositoryScope.of(context).weatherRepository,
            )..add(
                FetchWeatherEvent(city: City.london()),
              ),
            child: this,
          ),
        ),
      );
}

final GlobalKey<ScaffoldState> globalScaffoldkey = GlobalKey<ScaffoldState>();

class _WeatherScreenState extends State<WeatherScreen> {
  final ScrollController controller = ScrollController();
  final isAnimating = ValueNotifier(false);
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.position.isScrollingNotifier.addListener(_scrollListener);
    });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: ValueListenableBuilder<bool>(
          valueListenable: isAnimating,
          builder: (context, value, child) => IgnorePointer(
            ignoring: value,
            child: child,
          ),
          child: AutoTabsRouter.tabBar(
            routes: const [
              TodayTab(),
              TommorowTab(),
              ForecastTab(),
            ],
            builder: (context, child, tabController) {
              talker.info(tabController.index);
              return NestedScrollView(
                controller: controller,
                headerSliverBuilder: (context, innerBoxIsScrolled) => [
                  SliverPersistentHeader(
                    pinned: true,
                    delegate: CustomHeaderDelegate(
                      tabsController: tabController,
                    ),
                  ),
                ],
                body: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: BlocBuilder<WeatherBloc, WeatherState>(
                    builder: (context, state) => switch (state) {
                      WeatherLoading() => const Center(
                          child: CircularProgressIndicator(),
                        ),
                      WeatherLoaded() => child,
                    },
                  ),
                ),
              );
            },
          ),
        ),
      );

  Future<void> _scrollListener() async {
    final isScrollingValue = controller.position.isScrollingNotifier.value;
    if (!isScrollingValue && isAnimating.value && controller.offset < 215) {
      isAnimating.value = !isAnimating.value;
      if (controller.offset < 150) {
        await controller
            .animateTo(
              0,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            )
            .then((value) => isAnimating.value = false);
      } else {
        await controller
            .animateTo(
              200,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            )
            .then((value) => isAnimating.value = false);
      }
    } else {
      isAnimating.value = !isAnimating.value;
    }
  }
}
