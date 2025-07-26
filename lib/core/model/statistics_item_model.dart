import 'package:flutter/material.dart';

class StatisticsItemModel {
  final String quantity, relaive, title;
  final Widget? icon;

  const StatisticsItemModel({
    required this.quantity,
    this.icon,
    required this.relaive,
    required this.title,
  });
}
