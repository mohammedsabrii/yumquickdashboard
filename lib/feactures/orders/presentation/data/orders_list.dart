import 'package:flutter/material.dart';
import 'package:yumquickdashboard/feactures/orders/presentation/view/widget/completed_orders_list.dart';
import 'package:yumquickdashboard/feactures/orders/presentation/view/widget/on_track_list.dart';
import 'package:yumquickdashboard/feactures/orders/presentation/view/widget/orders_list.dart';

final List<Widget> myOrdersList = [
  const OrdersList(),
  const OnTrackList(),
  const CompletedOrdersList(),
  const OrdersList(),
];
