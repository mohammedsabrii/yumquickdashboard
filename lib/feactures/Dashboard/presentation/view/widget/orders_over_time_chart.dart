import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';

class OrdersOverTimeChart extends StatelessWidget {
  const OrdersOverTimeChart({super.key});

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        lineTouchData: LineTouchData(
          touchTooltipData: LineTouchTooltipData(
            getTooltipItems: (touchedSpots) {
              return touchedSpots.map((spot) {
                return LineTooltipItem(
                  '${spot.y.toInt()} Orders\nMay 22, ${_formatHour(spot.x)}',
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
                return Text(
                  _formatHour(value),
                  style: const TextStyle(fontSize: 10),
                );
              },
            ),
          ),

          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
        borderData: FlBorderData(show: false),
        minX: 4,
        maxX: 15,
        minY: 0,
        maxY: 50,

        lineBarsData: [
          LineChartBarData(
            spots: [
              FlSpot(4, 19),
              FlSpot(5, 10),
              FlSpot(6, 30),
              FlSpot(7, 15),
              FlSpot(8, 30),
              FlSpot(9, 20),
              FlSpot(10, 40),
              FlSpot(11, 35),
              FlSpot(12, 25),
              FlSpot(13, 30),
              FlSpot(14, 20),
              FlSpot(15, 45),
            ],
            isCurved: false,
            color: AppColor.kPinkishOrange,
            barWidth: 2,
            dotData: FlDotData(show: false),
          ),

          LineChartBarData(
            spots: [
              FlSpot(4, 8),
              FlSpot(5, 12),
              FlSpot(6, 20),
              FlSpot(7, 34),
              FlSpot(8, 28),
              FlSpot(9, 50),
              FlSpot(10, 40),
              FlSpot(11, 30),
              FlSpot(12, 35),
              FlSpot(13, 30),
              FlSpot(14, 32),
              FlSpot(15, 45),
            ],
            isCurved: false,
            color: AppColor.kMainColor,

            dotData: FlDotData(show: true),
          ),
        ],
      ),
    );
  }

  String _formatHour(double value) {
    // Map 4 -> 4am, 5 -> 5am, ..., 12 -> 12pm, 13 -> 1pm, etc.
    int hour = value.toInt();
    if (hour == 12) return '12pm';
    if (hour > 12) return '${hour - 12}pm';
    return '${hour}am';
  }
}
