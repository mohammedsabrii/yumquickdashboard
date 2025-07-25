import 'package:flutter/cupertino.dart';

class OrdersTableModel {
  final String order;
  final String date;
  final String customer;
  final String total;
  final Widget paymentState;
  final Widget orderState;

  const OrdersTableModel({
    required this.order,
    required this.date,
    required this.customer,
    required this.total,
    required this.orderState,
    required this.paymentState,
  });
}
