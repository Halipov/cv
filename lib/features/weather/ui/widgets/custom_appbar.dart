import 'package:cv/assets/color/color_scheme.dart';
import 'package:cv/features/weather/domain/model/_model.dart';
import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppColorScheme.of(context);
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: theme.primary.withOpacity(0.4),
            borderRadius: const BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                const SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    Text(weather.location.name),
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.search),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '${weather.current.temp.toInt()}°',
                      style: const TextStyle(
                        fontSize: 80,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          'Feels like ${weather.current.temp}°',
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.sunny,
                      size: 70,
                    )
                  ],
                ),
                const Align(
                  alignment: Alignment.centerRight,
                  child: Text('Day'),
                ),
                Row(
                  children: [
                    Text(
                      weather.current.lastUpdate.toString(),
                    ),
                    const Spacer(),
                    const Text('Day')
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: theme.primary.withOpacity(0.4),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(14),
                    ),
                  ),
                  child: const Text(
                    'today',
                  ),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                flex: 1,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: theme.primary.withOpacity(0.4),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(14),
                    ),
                  ),
                  child: const Text(
                    'today',
                  ),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                flex: 1,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: theme.primary.withOpacity(0.4),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(14),
                    ),
                  ),
                  child: const Text(
                    'today',
                  ),
                ),
              ),
            ],
          ),
        )
      ],
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
