import 'package:flutter/material.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';

class TotalOrdersItem extends StatelessWidget {
  const TotalOrdersItem({
    super.key,
    required this.totalOrders,
    required this.orderDay,
  });
  final String totalOrders, orderDay;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          totalOrders,
          style: AppStayls.styleInterBold20(
            context,
          ).copyWith(color: AppColor.kDarkRed),
        ),
        Text(
          'Orders on $orderDay',
          style: AppStayls.styleInterRegular14(
            context,
          ).copyWith(color: Colors.grey),
        ),
      ],
    );
  }
}
