import 'package:flutter/material.dart';
import 'package:yumquickdashboard/feactures/Dashboard/presentation/view/dashboard_view.dart';
import 'package:yumquickdashboard/feactures/Prodact/presentation/view/prodact_view.dart';
import 'package:yumquickdashboard/feactures/orders/presentation/view/orders_view.dart';

final List<Widget> drawerItamsData = [
  DashboardView(),
  OrdersView(),
  ProdactsView(),
  Container(height: 100, width: 100, color: Colors.red),
  Container(height: 100, width: 100, color: Colors.red),
  Container(height: 100, width: 100, color: Colors.red),
  Container(height: 100, width: 100, color: Colors.red),
  Container(height: 100, width: 100, color: Colors.red),
  Container(height: 100, width: 100, color: Colors.red),
  Container(height: 100, width: 100, color: Colors.red),
  Container(height: 100, width: 100, color: Colors.red),
  Container(height: 100, width: 100, color: Colors.red),
];
