import 'package:flutter/material.dart';
import 'package:yumquickdashboard/feactures/orders/presentation/view/widget/orders_page_view_container.dart';

class OrdersPageViewList extends StatelessWidget {
  const OrdersPageViewList({
    super.key,
    required this.cruntPageIndex,
    required this.onTap,
  });

  final int cruntPageIndex;
  final Function(int) onTap;
  final List<String> title = const [
    'Active',
    'On Track',
    'Completed',
    'Cancelled',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.03658,
      child: ListView.builder(
        itemCount: title.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: GestureDetector(
              onTap: () => onTap(index),
              child: OrdersPageViewContainer(
                title: title[index],
                isActive: index == cruntPageIndex,
              ),
            ),
          );
        },
      ),
    );
  }
}
