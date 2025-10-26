import 'package:flutter/material.dart';

class StatisticsItemModel {
  final String relaive, title;
  final Widget? icon;

  const StatisticsItemModel({
    this.icon,
    required this.relaive,
    required this.title,
  });
}
