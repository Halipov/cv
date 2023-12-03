import 'package:auto_route/auto_route.dart';
import 'package:cv/features/common/widgets/base/_base.dart';
import 'package:cv/features/weather/bloc/weather_bloc.dart';
import 'package:cv/features/weather/domain/_domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

@RoutePage(name: 'ForecastTab')
class ForecastPage extends StatelessWidget {
  const ForecastPage({super.key});

  @override
  Widget build(BuildContext context) => BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) => switch (state) {
          WeatherLoading() => const Center(
              child: CircularProgressIndicator(),
            ),
          WeatherLoaded() => _ForecastView(
              weather: state.weather,
            ),
        },
      );
}

class _ForecastView extends StatelessWidget {
  const _ForecastView({
    required this.weather,
  });
  final Weather weather;

  @override
  Widget build(BuildContext context) {
    final forecastList = weather.forecast.forecastday;
    return ListView.builder(
      padding: const EdgeInsets.only(top: 16),
      itemCount: forecastList.length,
      itemBuilder: (context, index) {
        final forecast = forecastList[index];
        return BaseContainer(
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    DateFormat('EEEE, MMM d').format(
                      forecast.date,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(forecast.day.condition.text),
                ],
              ),
              const Spacer(),
              Column(
                children: [
                  Text(
                    '${forecast.day.minTemp.toInt()}°',
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    '${forecast.day.minTemp.toInt()}°',
                  ),
                ],
              ),
              const SizedBox(
                width: 16,
              ),
              Image.network(
                'https:${forecast.day.condition.icon}',
                filterQuality: FilterQuality.high,
              ),
            ],
          ),
        );
      },
    );
  }
}
