import 'package:flutter/material.dart';
import 'package:yumquickdashboard/feactures/orders/presentation/view/widget/orders_bage_view_list.dart';
import 'package:yumquickdashboard/feactures/orders/presentation/view/widget/orders_page_view.dart';

class OrdersPageViewWithIndex extends StatefulWidget {
  const OrdersPageViewWithIndex({super.key});

  @override
  State<OrdersPageViewWithIndex> createState() =>
      _OrdersPageViewWithIndexState();
}

class _OrdersPageViewWithIndexState extends State<OrdersPageViewWithIndex> {
  late PageController pageController;
  int pageIndex = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    pageController.addListener(() {
      setState(() {
        pageIndex = pageController.page!.round();
      });
    });
  }

  void changePage(int index) {
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: OrdersPageViewList(
            cruntPageIndex: pageIndex,
            onTap: changePage,
          ),
        ),
        const SizedBox(height: 20),
        Expanded(child: OrdersPageView(controller: pageController)),
      ],
    );
  }
}
