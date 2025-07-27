import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class SalesGoalPieChart extends StatelessWidget {
  const SalesGoalPieChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Sales Goal',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: 80,
              height: 80,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  PieChart(
                    PieChartData(
                      sectionsSpace: 0,
                      centerSpaceRadius: 28,
                      startDegreeOffset: -90,
                      sections: [
                        PieChartSectionData(
                          color: Colors.amber,
                          value: 75,
                          showTitle: false,
                          radius: 8,
                        ),
                        PieChartSectionData(
                          color: Colors.grey.shade200,
                          value: 25,
                          showTitle: false,
                          radius: 8,
                        ),
                      ],
                    ),
                  ),
                  const Text(
                    '75%',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            _buildRow("Sold for:", "\$15,000"),
            const SizedBox(height: 4),
            _buildRow("Month goal:", "\$20,000"),
            const SizedBox(height: 4),
            _buildRow("Left:", "\$5,000"),
          ],
        ),
      ),
    );
  }

  Widget _buildRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label),
        Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }
}
