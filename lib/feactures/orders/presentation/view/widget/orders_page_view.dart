import 'package:flutter/material.dart';
import 'package:yumquickdashboard/feactures/orders/presentation/data/orders_list.dart';

class OrdersPageView extends StatelessWidget {
  const OrdersPageView({super.key, this.controller});
  final PageController? controller;
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller,
      itemCount: myOrdersList.length,
      itemBuilder: (context, index) => myOrdersList[index],
    );
  }
}
