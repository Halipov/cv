import 'package:auto_route/auto_route.dart';
import 'package:cv/features/weather/bloc/weather_bloc.dart';
import 'package:cv/features/weather/domain/_domain.dart';
import 'package:cv/features/weather/ui/widgets/_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage(name: 'TommorowTab')
class TommorowPage extends StatelessWidget {
  const TommorowPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) => switch (state) {
        WeatherLoading() => const Center(
            child: CircularProgressIndicator(),
          ),
        WeatherLoaded() => _TommorowView(weather: state.weather),
      },
    );
  }
}

class _TommorowView extends StatelessWidget {
  final Weather weather;
  const _TommorowView({
    Key? key,
    required this.weather,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentWeather = weather.forecast.forecastday[1];
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
        ],
      ),
    );
  }
}
