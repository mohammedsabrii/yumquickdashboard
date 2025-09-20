import 'package:flutter/widgets.dart';

class AllCouponsTableModel {
  final String couponName, usage, date;
  final Widget status;

  const AllCouponsTableModel({
    required this.couponName,
    required this.usage,
    required this.date,
    required this.status,
  });
}
