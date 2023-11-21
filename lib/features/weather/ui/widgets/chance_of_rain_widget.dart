import 'package:cv/features/common/widgets/base/_base.dart';
import 'package:cv/features/weather/domain/_domain.dart';
import 'package:cv/features/weather/ui/widgets/_widgets.dart';
import 'package:flutter/material.dart';

class ChanceOfRainWidget extends StatelessWidget {
  final List<HourWeather> hourlyForecastList;
  const ChanceOfRainWidget({
    super.key,
    required this.hourlyForecastList,
  });

  @override
  Widget build(BuildContext context) {
    return BaseContainer(
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
            constraints: const BoxConstraints(maxHeight: 150),
            child: ListView.builder(
              itemBuilder: (context, index) {
                final hourlyForecast = hourlyForecastList[index];
                return ProgressBarTile(
                  date: hourlyForecast.time,
                  persantage: hourlyForecast.chanceOfRain,
                );
              },
              itemCount: hourlyForecastList.length,
              padding: EdgeInsets.zero,
            ),
          )
        ],
      ),
    );
  }
}
