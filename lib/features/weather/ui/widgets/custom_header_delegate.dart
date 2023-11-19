import 'package:cv/assets/color/color_scheme.dart';
import 'package:cv/features/weather/domain/model/_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  CustomHeaderDelegate();
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
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
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: const NetworkImage(
                              'https://img.freepik.com/free-photo/mountain-forest-landscape-in-autumn-multi-colored-backdrop-generated-by-ai_188544-19704.jpg?size=626&ext=jpg&ga=GA1.1.672697106.1697846400&semt=ais'),
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
                                top: 30,
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    weather.location.name,
                                    style: TextStyle(
                                      color: Color.lerp(
                                        Colors.white,
                                        Colors.black,
                                        progress,
                                      ),
                                      fontSize: 20,
                                    ),
                                  ),
                                  const Spacer(),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.search,
                                      color: Color.lerp(
                                        Colors.white,
                                        Colors.black,
                                        progress,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 40.0),
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        top: 30,
                                      ),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            '${weather.current.temp.toInt()}°',
                                            style: TextStyle.lerp(
                                              const TextStyle(
                                                fontSize: 100,
                                                color: Colors.white,
                                              ),
                                              const TextStyle(
                                                fontSize: 40,
                                                color: Colors.black,
                                              ),
                                              progress,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.lerp(
                                              const EdgeInsets.only(bottom: 20),
                                              const EdgeInsets.only(bottom: 4),
                                              progress,
                                            )!,
                                            child: Text(
                                              'Feels like ${weather.current.temp}°',
                                              style: TextStyle.lerp(
                                                const TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.white,
                                                ),
                                                const TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.black,
                                                ),
                                                progress,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Padding(
                                      padding: EdgeInsets.lerp(
                                        const EdgeInsets.only(bottom: 20),
                                        const EdgeInsets.only(top: 30),
                                        progress,
                                      )!,
                                      child: Icon(
                                        Icons.sunny,
                                        size: 130 - 90 * progress,
                                        color: Color.lerp(
                                          Colors.white,
                                          Colors.black,
                                          progress,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            // const Align(
                            //   alignment: Alignment.centerRight,
                            //   child: Text('Day'),
                            // ),
                            // const Spacer(),
                            // Align(
                            //   alignment: Alignment.bottomLeft,
                            //   child: Text(
                            //     DateFormat('MMMM d, hh:mm').format(weather.current.lastUpdate),
                            //   ),
                            // ),
                            // const SizedBox(
                            //   height: 15,
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        ForecastButton(text: 'Today'),
                        ForecastButton(text: 'Tommorow'),
                        ForecastButton(text: '10 days'),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16 * progress,
                  ),
                ],
              ),
            ),
          ),
          // AnimatedContainer(
          //   duration: const Duration(milliseconds: 100),
          //   padding: EdgeInsets.lerp(
          //     const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          //     const EdgeInsets.only(bottom: 16),
          //     progress,
          //   ),
          //   alignment: Alignment.lerp(
          //     Alignment.bottomLeft,
          //     Alignment.bottomRight,
          //     progress,
          //   ),
          //   child: Text(
          //     'Mountains',
          //     style: TextStyle.lerp(
          //       const TextStyle(color: Colors.green),
          //       const TextStyle(color: Colors.white),
          //       progress,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  @override
  OverScrollHeaderStretchConfiguration get stretchConfiguration => OverScrollHeaderStretchConfiguration();

  @override
  FloatingHeaderSnapConfiguration? get snapConfiguration => FloatingHeaderSnapConfiguration();

  @override
  double get maxExtent => 400;

  @override
  double get minExtent => 200;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return maxExtent != oldDelegate.maxExtent || minExtent != oldDelegate.minExtent;
  }
}

class ForecastButton extends StatelessWidget {
  const ForecastButton({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = AppColorScheme.of(context);
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
          ),
          decoration: BoxDecoration(
            color: theme.primary,
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
      ),
    );
  }
}

final weather = Weather(
  location: Location(
    name: 'Minsk',
    region: 'region',
    country: 'country',
    localtime: DateTime.now(),
  ),
  current: CurrentWeather(
    lastUpdate: DateTime.now(),
    temp: 5,
    feelsLike: 5,
    condition: Condition(text: 'text', icon: '', code: 2),
    windSpeed: 5,
    windDirection: 'w',
    pressure: 2,
    precipitation: 2,
    humidity: 2,
    cloud: 2,
    uv: 2,
  ),
  forecast: Forecast(
    forecastday: [],
  ),
);
