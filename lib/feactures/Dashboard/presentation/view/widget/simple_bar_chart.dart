import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';

class SimpleBarChart extends StatelessWidget {
  const SimpleBarChart({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200, // adjust as needed
      child: BarChart(
        BarChartData(
          barTouchData: BarTouchData(
            enabled: true,
            touchTooltipData: BarTouchTooltipData(
              // tooltipBgColor: Colors.black87,
              getTooltipItem: (group, groupIndex, rod, rodIndex) {
                return BarTooltipItem(
                  '\$${rod.toY.toInt()}',
                  const TextStyle(color: Colors.white, fontSize: 12),
                );
              },
            ),
          ),
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 1,
                getTitlesWidget: (value, meta) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Text(
                      '${value.toInt()}',
                      style: const TextStyle(fontSize: 10),
                    ),
                  );
                },
              ),
            ),
          ),
          gridData: FlGridData(show: false),
          borderData: FlBorderData(show: false),
          barGroups: [
            makeGroup(12, 10),
            makeGroup(13, 12),
            makeGroup(14, 14),
            makeGroup(15, 16),
            makeGroup(16, 18),
            makeGroup(17, 17),
            makeGroup(18, 19),
          ],
        ),
      ),
    );
  }

  BarChartGroupData makeGroup(double x, double y) {
    return BarChartGroupData(
      x: x.toInt(),
      barRods: [
        BarChartRodData(
          toY: y,
          width: 12,
          color: AppColor.kYellowBase,
          borderRadius: BorderRadius.circular(4),
        ),
      ],
    );
  }
}
