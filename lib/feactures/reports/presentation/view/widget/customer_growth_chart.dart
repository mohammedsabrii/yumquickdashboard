import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';

class CustomerGrowthChart extends StatelessWidget {
  const CustomerGrowthChart({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.28,
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          maxY: 500,
          barGroups: buildBarGroups(),
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: true, reservedSize: 40),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  const months = [
                    'Jan',
                    'Feb',
                    'Mar',
                    'Apr',
                    'May',
                    'Jun',
                    'Jul',
                    'Aug',
                    'Sep',
                    'Oct',
                    'Nov',
                    'Dec',
                  ];
                  return Text(
                    months[value.toInt()],
                    style: TextStyle(fontSize: 10),
                  );
                },
              ),
            ),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          gridData: FlGridData(show: true),
          borderData: FlBorderData(show: false),
          groupsSpace: 10,
        ),
      ),
    );
  }

  List<BarChartGroupData> buildBarGroups() {
    final returningCustomers = [
      400,
      380,
      420,
      450,
      460,
      410,
      400,
      410,
      420,
      400,
      390,
      410,
    ];
    final newCustomers = [
      300,
      250,
      180,
      260,
      220,
      240,
      150,
      160,
      170,
      230,
      190,
      140,
    ];

    return List.generate(12, (index) {
      return BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
            toY: returningCustomers[index].toDouble(),
            color: Colors.grey,
            width: 8,
            borderRadius: BorderRadius.circular(5),
          ),
          BarChartRodData(
            toY: newCustomers[index].toDouble(),
            color: AppColor.kMainColor,
            width: 8,
            borderRadius: BorderRadius.circular(5),
          ),
        ],
      );
    });
  }
}
