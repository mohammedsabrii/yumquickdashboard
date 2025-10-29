import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:yumquickdashboard/core/service/get_completed_orders_service.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';

class SimpleBarChart extends StatelessWidget {
  final List<DailySales> itemsSoldLast7Days;

  const SimpleBarChart({super.key, required this.itemsSoldLast7Days});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.275,
      child: BarChart(
        BarChartData(
          barTouchData: BarTouchData(
            enabled: true,
            touchTooltipData: BarTouchTooltipData(
              getTooltipItem: (group, groupIndex, rod, rodIndex) {
                final day = itemsSoldLast7Days[groupIndex].day;
                final date = DateTime.parse(day);
                return BarTooltipItem(
                  '${DateFormat('d MMM').format(date)}\n${rod.toY.toInt()} items',
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
                  if (index >= itemsSoldLast7Days.length)
                    return const SizedBox();
                  final date = DateTime.parse(itemsSoldLast7Days[index].day);
                  return Text(
                    DateFormat('d').format(date),
                    style: const TextStyle(fontSize: 10),
                  );
                },
              ),
            ),
          ),
          gridData: FlGridData(show: false),
          borderData: FlBorderData(show: false),
          barGroups:
              itemsSoldLast7Days
                  .asMap()
                  .entries
                  .map(
                    (e) => makeGroup(
                      e.key.toDouble(),
                      e.value.itemsSold.toDouble(),
                    ),
                  )
                  .toList(),
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
