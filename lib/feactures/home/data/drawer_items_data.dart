import 'package:flutter/material.dart';
import 'package:yumquickdashboard/feactures/Offers/presentation/view/offers_view.dart';
import 'package:yumquickdashboard/feactures/Customers/presentation/view/customers_view.dart';
import 'package:yumquickdashboard/feactures/Dashboard/presentation/view/dashboard_view.dart';
import 'package:yumquickdashboard/feactures/Prodact/presentation/view/prodact_view.dart';
import 'package:yumquickdashboard/feactures/category/presentation/view/category_view.dart';
import 'package:yumquickdashboard/feactures/orders/presentation/view/orders_view.dart';
import 'package:yumquickdashboard/feactures/reports/presentation/view/report_view.dart';

final List<Widget> drawerItamsData = [
  DashboardView(),
  OrdersView(),
  ProdactsView(),
  CategoryView(),
  CustomersView(),
  ReportView(),
  OffersView(),
];
