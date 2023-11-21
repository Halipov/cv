import 'package:auto_route/auto_route.dart';
import 'package:cv/features/common/widgets/di_scope/app_scope.dart';
import 'package:cv/features/weather/bloc/weather_bloc.dart';
import 'package:cv/features/weather/di/_di_storages.dart';
import 'package:cv/features/weather/domain/_domain.dart';
import 'package:cv/features/weather/ui/pages/_pages.dart';
import 'package:cv/features/weather/ui/widgets/_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class WeatherScreen extends StatefulWidget implements AutoRouteWrapper {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return WeatherServiceScope(
      create: (context) => WeatherServiceStorage(
        dio: AppScope.of(context).dio,
      ),
      child: WeatherRepositoryScope(
        create: (context) => WeatherRepositoryStorage(
          weatherService: WeatherServiceScope.of(context).weatherService,
        ),
        child: BlocProvider<WeatherBloc>(
          create: (context) => WeatherBloc(
            themeService: AppScope.of(context).themeService,
            weatherRepository: WeatherRepositoryScope.of(context).weatherRepository,
          )..add(
              FetchWeatherEvent(city: City.london()),
            ),
          child: this,
        ),
      ),
    );
  }
}

final GlobalKey<ScaffoldState> globalScaffoldkey = GlobalKey<ScaffoldState>();

class _WeatherScreenState extends State<WeatherScreen> {
  final ScrollController controller = ScrollController();
  final ValueNotifier isAnimating = ValueNotifier(false);
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: isAnimating,
        builder: (context, value, child) => IgnorePointer(
          ignoring: value,
          child: child,
        ),
        child: NestedScrollView(
          controller: controller,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverPersistentHeader(
              pinned: true,
              floating: false,
              delegate: CustomHeaderDelegate(),
            ),
          ],
          body: BlocBuilder<WeatherBloc, WeatherState>(
            builder: (context, state) => switch (state) {
              WeatherLoading() => const Center(
                  child: CircularProgressIndicator(),
                ),
              WeatherLoaded() => WeatherView(
                  weather: state.weather,
                ),
            },
          ),
        ),
      ),
    );
  }

  void _scrollListener() {
    if (!controller.position.isScrollingNotifier.value && isAnimating.value && controller.offset < 215) {
      isAnimating.value = !isAnimating.value;
      if (controller.offset < 150) {
        controller
            .animateTo(
              0,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            )
            .then((value) => isAnimating.value = false);
      } else {
        controller
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

class WeatherView extends StatelessWidget {
  final Weather weather;
  const WeatherView({
    super.key,
    required this.weather,
  });

  @override
  Widget build(BuildContext context) {
    final currentWeather = weather.forecast.forecastday.first;
    final hourlyForecastList = currentWeather.hour
        .where(
          (e) => e.time.hour >= DateTime.now().hour,
        )
        .toList();
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: WeatherTodayPage(
        weather: weather,
        currentWeather: currentWeather,
        hourlyForecastList: hourlyForecastList,
      ),
    );
  }
}
