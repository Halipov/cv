import 'package:cv/assets/color/color_scheme.dart';
import 'package:cv/features/weather/domain/model/forecast_day_weather.dart';
import 'package:cv/util/extensions/date_helpers.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ChartWidget extends StatelessWidget {
  final List<ForecastDayWeather> forecastDayWeatherList;
  const ChartWidget({
    super.key,
    required this.forecastDayWeatherList,
  });

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        gridData: FlGridData(
          show: true,
          horizontalInterval: 9.9,
          verticalInterval: 7,
          getDrawingHorizontalLine: (value) {
            return FlLine(
              color: Colors.black.withOpacity(0.2),
              strokeWidth: 2,
            );
          },
        ),
        titlesData: FlTitlesData(
          show: true,
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          bottomTitles: const AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 30,
              interval: 1,
              getTitlesWidget: bottomTitleWidgets,
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: 10,
              getTitlesWidget: (value, meta) => Text(
                value.toString(),
                textAlign: TextAlign.left,
              ),
              reservedSize: 40,
            ),
          ),
        ),
        lineTouchData: LineTouchData(
            enabled: true,
            touchSpotThreshold: 20,
            touchTooltipData: const LineTouchTooltipData(
              tooltipPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              tooltipRoundedRadius: 15,
              tooltipBgColor: Colors.white,
            ),
            getTouchedSpotIndicator: (LineChartBarData barData, List<int> spotIndexes) {
              return spotIndexes.map((index) {
                return TouchedSpotIndicatorData(
                  const FlLine(
                    color: Colors.black,
                    dashArray: [6, 6],
                  ),
                  FlDotData(
                    show: true,
                    getDotPainter: (spot, percent, barData, index) => FlDotCirclePainter(
                      radius: 5,
                      color: Colors.black,
                      strokeWidth: 2,
                      strokeColor: Colors.white,
                    ),
                  ),
                );
              }).toList();
            }),
        borderData: FlBorderData(
          show: false,
        ),
        minX: 1,
        maxX: 7,
        minY: -10,
        maxY: 10,
        lineBarsData: [
          LineChartBarData(
            color: AppColorScheme.of(context).onSurface,
            spots: getSeries(forecastDayWeatherList),
            isCurved: true,
            barWidth: 2,
            isStrokeCapRound: true,
            dotData: const FlDotData(
              show: false,
            ),
            belowBarData: BarAreaData(
              show: true,
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColorScheme.of(context).primary.withOpacity(0.3),
                  AppColorScheme.of(context).primary.withOpacity(0.3),
                  Colors.transparent,
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

List<FlSpot> getSeries(List<ForecastDayWeather> list) {
  return list.map((e) => FlSpot(e.date.weekday.toDouble(), e.day.avgTemp)).toList();
}

Widget bottomTitleWidgets(double value, TitleMeta meta) {
  final now = DateTime.now()
      .subtract(
        const Duration(days: 1),
      )
      .add(
        Duration(
          days: value.toInt(),
        ),
      );
  return SideTitleWidget(
    space: 14,
    axisSide: AxisSide.bottom,
    child: Text(now.getWeekDayName),
  );
}
