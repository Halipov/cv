import 'package:auto_route/auto_route.dart';
import 'package:cv/features/common/widgets/base/_base.dart';
import 'package:cv/features/common/widgets/di_scope/app_scope.dart';
import 'package:cv/features/weather/bloc/weather_bloc.dart';
import 'package:cv/features/weather/di/weather_repository_storage.dart';
import 'package:cv/features/weather/di/weather_service_storage.dart';
import 'package:cv/features/weather/ui/widgets/_widgets.dart';
import 'package:cv/features/weather/ui/widgets/di/weather_repository_scope.dart';
import 'package:cv/features/weather/ui/widgets/di/weather_service_scope.dart';
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
          lazy: false,
          create: (context) => WeatherBloc(
            weatherRepository: WeatherRepositoryScope.of(context).weatherRepository,
          )..add(FetchWeatherEvent()),
          child: this,
        ),
      ),
    );
  }
}

class _WeatherScreenState extends State<WeatherScreen> {
  late ScrollController controller;
  late ValueNotifier isAnimating;
  @override
  void initState() {
    controller = ScrollController();
    isAnimating = ValueNotifier(false);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.position.isScrollingNotifier.addListener(_scrollListener);
    });

    super.initState();
  }

  @override
  void dispose() {
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
          body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  const Row(
                    children: [
                      SmallCardWidget(
                        title: 'Wind speed',
                        value: '12 km/h',
                        icon: Icons.air,
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      SmallCardWidget(
                        title: 'Wind speed',
                        value: '12 km/h',
                        icon: Icons.cloud,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Row(
                    children: [
                      SmallCardWidget(
                        title: 'Wind speed',
                        value: '12 km/h',
                        icon: Icons.waves,
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      SmallCardWidget(
                        title: 'Wind speed',
                        value: '12 km/h',
                        icon: Icons.sunny,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  BaseContainer(
                    child: Column(
                      children: [
                        const Row(
                          children: [
                            BaseIcon(
                              icon: Icons.timer_outlined,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text('Hourly forecast')
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ConstrainedBox(
                          constraints: const BoxConstraints(maxHeight: 100),
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 20,
                            itemBuilder: (context, index) {
                              return const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Now'),
                                    BaseIcon(icon: Icons.sunny),
                                    Text('10'),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  BaseContainer(
                    child: Column(
                      children: [
                        const Row(
                          children: [
                            BaseIcon(
                              icon: Icons.calendar_today,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text('Day forecast')
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ConstrainedBox(
                          constraints: const BoxConstraints(
                            maxHeight: 170,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.only(right: 20, left: 8, top: 16, bottom: 8),
                            child: ChartWidget(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const BaseContainer(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            BaseIcon(
                              icon: Icons.calendar_today,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text('Day forecast')
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ProgressBarTile(),
                        ProgressBarTile(),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Row(
                    children: [
                      SmallCardWidget(
                        title: 'Wind speed',
                        value: '12 km/h',
                        icon: Icons.waves,
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      SmallCardWidget(
                        title: 'Wind speed',
                        value: '12 km/h',
                        icon: Icons.sunny,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _scrollListener() {
    if (!controller.position.isScrollingNotifier.value && isAnimating.value && controller.offset < 200) {
      isAnimating.value = !isAnimating.value;
      if (controller.offset < 100) {
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
