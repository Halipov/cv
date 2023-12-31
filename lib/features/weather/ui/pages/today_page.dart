import 'package:auto_route/auto_route.dart';
import 'package:cv/features/common/widgets/base/_base.dart';
import 'package:cv/features/weather/bloc/weather_bloc.dart';
import 'package:cv/features/weather/domain/_domain.dart';
import 'package:cv/features/weather/ui/widgets/_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage(name: 'TodayTab')
class TodayPage extends StatelessWidget {
  const TodayPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) => BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) => switch (state) {
          WeatherLoading() => const Center(
              child: CircularProgressIndicator(),
            ),
          WeatherLoaded() => _TodayLoadedView(weather: state.weather),
        },
      );
}

class _TodayLoadedView extends StatelessWidget {
  const _TodayLoadedView({
    required this.weather,
  });
  final Weather weather;

  @override
  Widget build(BuildContext context) {
    final currentWeather = weather.forecast.forecastday.first;
    final hourlyForecastList = currentWeather.hour
        .where(
          (e) => e.time.hour >= DateTime.now().hour,
        )
        .toList();
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              SmallCardWidget(
                title: 'Wind speed',
                value: '${weather.current.windSpeed.toInt()}km/h',
                icon: Icons.air,
              ),
              const SizedBox(
                width: 16,
              ),
              SmallCardWidget(
                title: 'Rain chance',
                value: '${currentWeather.day.dailyChanceOfRain}%',
                icon: Icons.cloud,
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              SmallCardWidget(
                title: 'Pressure',
                value: '${weather.current.pressure.toInt()} hpa',
                icon: Icons.waves,
              ),
              const SizedBox(
                width: 16,
              ),
              SmallCardWidget(
                title: 'UV index',
                value: weather.current.uv.toString().replaceFirst('.', ','),
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
                    Text('Hourly forecast'),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxHeight: 100),
                  child: HourlyForecastWidget(
                    hourlyForeacastList: hourlyForecastList,
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
                    Text('Day forecast'),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxHeight: 170,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: 20,
                      left: 8,
                      top: 16,
                      bottom: 8,
                    ),
                    child: ChartWidget(
                      forecastDayWeatherList: weather.forecast.forecastday,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          ChanceOfRainWidget(
            hourlyForecastList: hourlyForecastList,
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              SmallCardWidget(
                title: 'Sunrise',
                value: weather.forecast.forecastday.first.astro.sunrise,
                icon: Icons.waves,
              ),
              const SizedBox(
                width: 16,
              ),
              SmallCardWidget(
                title: 'Sunset',
                value: weather.forecast.forecastday.first.astro.sunset,
                icon: Icons.sunny,
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
