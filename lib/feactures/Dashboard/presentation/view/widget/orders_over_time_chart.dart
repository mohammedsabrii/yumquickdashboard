import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:yumquickdashboard/core/service/get_completed_orders_service.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';

class OrdersOverTimeChart extends StatelessWidget {
  final List<HourlySales> itemsSoldPerHour;

  const OrdersOverTimeChart({super.key, required this.itemsSoldPerHour});

  @override
  Widget build(BuildContext context) {
    final spots =
        itemsSoldPerHour
            .asMap()
            .entries
            .map((e) => FlSpot(e.key.toDouble(), e.value.itemsSold.toDouble()))
            .toList();

    return LineChart(
      LineChartData(
        lineTouchData: LineTouchData(
          touchTooltipData: LineTouchTooltipData(
            getTooltipItems: (touchedSpots) {
              return touchedSpots.map((spot) {
                final hour = itemsSoldPerHour[spot.x.toInt()].hour;
                return LineTooltipItem(
                  '${spot.y.toInt()} Orders\n${_formatHourLabel(hour)}',
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
              interval: 3, // كل 3 ساعات
              getTitlesWidget: (value, meta) {
                final index = value.toInt();
                if (index >= itemsSoldPerHour.length) return const SizedBox();
                return Text(
                  _formatHourLabel(itemsSoldPerHour[index].hour),
                  style: const TextStyle(fontSize: 10),
                );
              },
            ),
          ),
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
        borderData: FlBorderData(show: false),
        minY: 0,
        maxY: _getMaxY(spots),
        lineBarsData: [
          LineChartBarData(
            spots: spots,
            isCurved: true,
            color: AppColor.kMainColor,
            barWidth: 3,
            dotData: FlDotData(show: false),
          ),
        ],
      ),
    );
  }

  String _formatHourLabel(String hourText) {
    final hour = int.tryParse(hourText.split(':').first) ?? 0;
    if (hour == 0) return '12am';
    if (hour < 12) return '$hour am';
    if (hour == 12) return '12pm';
    return '${hour - 12}pm';
  }

  double _getMaxY(List<FlSpot> spots) {
    if (spots.isEmpty) return 10;
    final max = spots.map((s) => s.y).reduce((a, b) => a > b ? a : b);
    return (max + 5).ceilToDouble();
  }
}
