import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ChartWidget extends StatelessWidget {
  const ChartWidget({
    super.key,
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
            color: Colors.black,
            spots: const [
              FlSpot(1, -1),
              FlSpot(2, 2),
              FlSpot(3, 3),
              FlSpot(4, 3),
              FlSpot(5, 3),
              FlSpot(6, 3),
              FlSpot(7, 3),
            ],
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
                  Colors.deepPurple.withOpacity(0.3),
                  Colors.deepPurple.withOpacity(0.1),
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

Widget bottomTitleWidgets(double value, TitleMeta meta) {
  const style = TextStyle(
    fontSize: 15,
  );
  Widget text;
  switch (value.toInt()) {
    case 1:
      text = const Text('Mon', style: style);
      break;
    case 2:
      text = const Text('Tue', style: style);
      break;
    case 3:
      text = const Text('Wen', style: style);
      break;
    case 4:
      text = const Text('Thu', style: style);
      break;
    case 5:
      text = const Text('Fri', style: style);
      break;
    case 6:
      text = const Text('Sat', style: style);
      break;
    case 7:
      text = const Text('Sun', style: style);
      break;
    default:
      text = const Text('', style: style);
      break;
  }

  return SideTitleWidget(
    space: 14,
    axisSide: AxisSide.bottom,
    child: text,
  );
}
