import 'package:auto_route/auto_route.dart';
import 'package:cv/assets/color/color_scheme.dart';
import 'package:cv/features/weather/bloc/weather_bloc.dart';
import 'package:cv/features/weather/domain/model/_model.dart';
import 'package:cv/features/weather/enum/weather_tab_enum.dart';
import 'package:cv/features/weather/ui/widgets/custom_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  CustomHeaderDelegate({required this.tabsController});

  final TabController tabsController;
  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final double progress;
    if (shrinkOffset > 200) {
      progress = 1;
    } else {
      progress = shrinkOffset / 200;
    }
    final theme = AppColorScheme.of(context);
    return Material(
      child: Stack(
        fit: StackFit.expand,
        children: [
          ColoredBox(
            color: Color.lerp(
              theme.background,
              theme.secondary.withOpacity(0.6),
              progress,
            )!,
            child: SizedBox(
              height: maxExtent - shrinkOffset,
              child: Column(
                children: [
                  BlocBuilder<WeatherBloc, WeatherState>(
                    builder: (context, state) => switch (state) {
                      WeatherLoading() => const Expanded(
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      WeatherLoaded() => ExpandedAppBar(
                          weather: state.weather,
                          progress: progress,
                        )
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  WeatherTabBar(
                    tabsController: tabsController,
                  ),
                  SizedBox(
                    height: 16 * progress,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  OverScrollHeaderStretchConfiguration get stretchConfiguration =>
      OverScrollHeaderStretchConfiguration();

  @override
  FloatingHeaderSnapConfiguration? get snapConfiguration =>
      FloatingHeaderSnapConfiguration();

  @override
  double get maxExtent => 430;

  @override
  double get minExtent => 230;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      maxExtent != oldDelegate.maxExtent || minExtent != oldDelegate.minExtent;
}

class WeatherTabBar extends StatefulWidget {
  const WeatherTabBar({
    super.key,
    required this.tabsController,
  });
  final TabController tabsController;

  @override
  State<WeatherTabBar> createState() => _WeatherTabBarState();
}

class _WeatherTabBarState extends State<WeatherTabBar> {
  @override
  void initState() {
    widget.tabsController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final tabsRouter = AutoTabsRouter.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ...WeatherTabEnum.values.map(
            (e) => GestureDetector(
              onTap: () {
                widget.tabsController.animateTo(e.index);
              },
              child: ForecastButton(
                index: e.index,
                isSelected: tabsRouter.activeIndex == e.index,
                text: e.toString(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ForecastButton extends StatelessWidget {
  const ForecastButton({
    super.key,
    required this.text,
    required this.index,
    required this.isSelected,
  });

  final String text;
  final int index;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final theme = AppColorScheme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
        ),
        width: 100,
        decoration: BoxDecoration(
          color: isSelected ? theme.primary : theme.secondary.withOpacity(0.6),
          borderRadius: const BorderRadius.all(
            Radius.circular(14),
          ),
        ),
        child: Center(
          child: Text(
            text,
          ),
        ),
      ),
    );
  }
}

class ExpandedAppBar extends StatelessWidget {
  const ExpandedAppBar({
    super.key,
    required this.weather,
    required this.progress,
  });
  final Weather weather;
  final double progress;

  @override
  Widget build(BuildContext context) => Expanded(
        child: DecoratedBox(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: weather.current.isDay
                  ? const AssetImage('assets/day_background.jpg')
                  : const AssetImage('assets/night_background.jpg'),
              fit: BoxFit.none,
              opacity: 1 - progress,
            ),
            borderRadius: const BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 23,
            ).copyWith(
              top: 16,
            ),
            child: Stack(
              children: [
                const SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 50,
                  ),
                  child: CustomSearchBar(
                    initialQuery: weather.location.name,
                    color: Color.lerp(
                      Colors.white.withOpacity(0.9),
                      AppColorScheme.of(context).onSurface,
                      progress,
                    )!,
                    onComplete: (city) {
                      BlocProvider.of<WeatherBloc>(context).add(
                        FetchWeatherEvent(
                          city: city,
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.lerp(
                            const EdgeInsets.only(bottom: 20),
                            const EdgeInsets.only(top: 40),
                            progress,
                          )!,
                          child: Row(
                            children: [
                              Text(
                                '${weather.current.temp.toInt()}°',
                                style: TextStyle.lerp(
                                  TextStyle(
                                    fontSize: 100,
                                    color: Colors.white.withOpacity(0.8),
                                  ),
                                  TextStyle(
                                    fontSize: 40,
                                    color: AppColorScheme.of(context).onSurface,
                                  ),
                                  progress,
                                ),
                              ),
                              const Spacer(),
                              Image.network(
                                'https:${weather.current.condition.icon}',
                                scale: 0.5,
                                filterQuality: FilterQuality.high,
                                height: 150 - 70 * progress,
                                width: 150 - 70 * progress,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.lerp(
                          Alignment.bottomCenter,
                          Alignment.bottomLeft,
                          progress,
                        )!,
                        child: Padding(
                          padding: EdgeInsets.lerp(
                            const EdgeInsets.only(bottom: 20),
                            const EdgeInsets.only(
                              bottom: 15,
                              left: 60,
                            ),
                            progress,
                          )!,
                          child: Text(
                            'Feels like ${weather.current.feelsLike}°',
                            style: TextStyle.lerp(
                              const TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                              TextStyle(
                                fontSize: 12,
                                color: AppColorScheme.of(context).onSurface,
                              ),
                              progress,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
