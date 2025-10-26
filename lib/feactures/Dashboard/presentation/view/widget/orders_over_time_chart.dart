import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/feactures/Dashboard/entity/app_state_entity.dart';

class OrdersOverTimeChart extends StatelessWidget {
  final List<HourlySales> itemsSoldPerHour;

  const OrdersOverTimeChart({super.key, required this.itemsSoldPerHour});

  @override
  Widget build(BuildContext context) {
    final spots =
        itemsSoldPerHour.asMap().entries.map((entry) {
          final index = entry.key.toDouble();
          final sales = entry.value.itemsSold.toDouble();
          return FlSpot(index, sales);
        }).toList();

    return LineChart(
      LineChartData(
        lineTouchData: LineTouchData(
          touchTooltipData: LineTouchTooltipData(
            getTooltipItems: (touchedSpots) {
              return touchedSpots.map((spot) {
                final hourLabel = itemsSoldPerHour[spot.x.toInt()].hour;
                return LineTooltipItem(
                  '${spot.y.toInt()} Orders\n$hourLabel',
                  const TextStyle(color: Colors.white, fontSize: 12),
                );
              }).toList();
            },
          ),
        ),
        gridData: FlGridData(show: true),
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: 1,
              getTitlesWidget: (value, meta) {
                final hourLabel = itemsSoldPerHour[value.toInt()].hour;
                return Text(
                  _formatHourLabel(hourLabel),
                  style: const TextStyle(fontSize: 10),
                );
              },
            ),
          ),
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
        borderData: FlBorderData(show: false),

        minY: 0,
        maxY: getMaxY(spots),

        lineBarsData: [
          LineChartBarData(
            spots: spots,
            isCurved: true,
            color: AppColor.kMainColor,
            // dotData: FlDotData(show: true),
            barWidth: 3,
          ),
        ],
      ),
    );
  }

  String _formatHourLabel(String hourText) {
    final hour = int.tryParse(hourText.split(':').first) ?? 0;
    if (hour == 0) return '12am';
    if (hour < 12) return '${hour}am';
    if (hour == 12) return '12pm';
    return '${hour - 12}pm';
  }

  double getMaxY(List<FlSpot> spots) {
    if (spots.isEmpty) return 10;
    final maxVal = spots.map((s) => s.y).reduce((a, b) => a > b ? a : b);
    return (maxVal + 10).clamp(10, double.infinity);
  }
}
