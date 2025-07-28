import 'package:flutter/material.dart';

class PieChartModel {
  final String title, percentage;
  final Widget pieChartItem;
  final double highestPercentage, lowestPercentage;
  final Color percentageColor;

  const PieChartModel({
    required this.title,
    required this.percentage,
    required this.pieChartItem,
    required this.highestPercentage,
    required this.lowestPercentage,
    required this.percentageColor,
  });
}
