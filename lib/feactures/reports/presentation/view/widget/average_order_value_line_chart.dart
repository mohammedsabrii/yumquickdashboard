import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';

class AverageOrderValueLineChart extends StatelessWidget {
  const AverageOrderValueLineChart({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.222,
      child: LineChart(
        LineChartData(
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 32,
                interval: 20,
                getTitlesWidget: (value, meta) {
                  return Text(
                    '\$${value.toInt()}',
                    style: const TextStyle(color: Colors.grey, fontSize: 10),
                  );
                },
              ),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 2,
                getTitlesWidget: (value, meta) {
                  switch (value.toInt()) {
                    case 2:
                      return const Text('4am', style: TextStyle(fontSize: 10));
                    case 4:
                      return const Text('8am', style: TextStyle(fontSize: 10));
                    case 6:
                      return const Text('12pm', style: TextStyle(fontSize: 10));
                    case 8:
                      return const Text('4pm', style: TextStyle(fontSize: 10));
                    case 10:
                      return const Text('8pm', style: TextStyle(fontSize: 10));
                    case 12:
                      return const Text(
                        'Jun 12',
                        style: TextStyle(fontSize: 10),
                      );
                    default:
                      return const SizedBox.shrink();
                  }
                },
              ),
            ),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          borderData: FlBorderData(show: false),
          minX: 0,
          maxX: 12,
          minY: 0,
          maxY: 80,
          lineBarsData: [
            LineChartBarData(
              spots: [
                FlSpot(0, 20),
                FlSpot(2, 10),
                FlSpot(4, 40),
                FlSpot(6, 20),
                FlSpot(8, 30),
                FlSpot(10, 70),
                FlSpot(12, 25),
              ],

              color: AppColor.kMainColor,
              barWidth: 3,
              dotData: FlDotData(show: false),
            ),
          ],
        ),
      ),
    );
  }
}
