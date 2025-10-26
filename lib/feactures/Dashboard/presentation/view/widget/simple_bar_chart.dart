import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/feactures/Dashboard/entity/app_state_entity.dart';

class SimpleBarChart extends StatelessWidget {
  final List<DailySales> itemsSoldLast7Days;

  const SimpleBarChart({super.key, required this.itemsSoldLast7Days});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: BarChart(
        BarChartData(
          barTouchData: BarTouchData(
            enabled: true,
            touchTooltipData: BarTouchTooltipData(
              getTooltipItem: (group, groupIndex, rod, rodIndex) {
                final day = itemsSoldLast7Days[groupIndex].day;
                return BarTooltipItem(
                  '$day\n${rod.toY.toInt()} items',
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
                  final index = value.toInt();
                  if (index < 0 || index >= itemsSoldLast7Days.length) {
                    return const SizedBox.shrink();
                  }

                  final dateStr = itemsSoldLast7Days[index].day;
                  final date = DateTime.tryParse(dateStr);

                  final dayNumber =
                      date != null ? DateFormat('d').format(date) : dateStr;

                  return Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Text(
                      dayNumber,
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
            for (int i = 0; i < itemsSoldLast7Days.length; i++)
              makeGroup(
                i.toDouble(),
                itemsSoldLast7Days[i].itemsSold.toDouble(),
              ),
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
