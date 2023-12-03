import 'package:cv/features/weather/domain/_domain.dart';
import 'package:cv/util/extensions/date_helpers.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HourlyForecastWidget extends StatelessWidget {
  const HourlyForecastWidget({
    super.key,
    required this.hourlyForeacastList,
  });

  final List<HourWeather> hourlyForeacastList;

  @override
  Widget build(BuildContext context) => ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: hourlyForeacastList.length,
        itemBuilder: (context, index) {
          final currentHourlyWeather = hourlyForeacastList[index];
          return Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  currentHourlyWeather.time.isNow
                      ? 'Now'
                      : DateFormat('ha')
                          .format(currentHourlyWeather.time)
                          .toLowerCase(),
                ),
                Image.network(
                  'https:${currentHourlyWeather.condition.icon}',
                  height: 30,
                  width: 30,
                ),
                Text('${currentHourlyWeather.temp.toInt()}°'),
              ],
            ),
          );
        },
      );
}
