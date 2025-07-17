import 'package:flutter/material.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';

class TotalItem extends StatelessWidget {
  const TotalItem({super.key, required this.totalOrders, required this.title});
  final String totalOrders, title;
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
          title,
          style: AppStayls.styleInterRegular14(
            context,
          ).copyWith(color: Colors.grey),
        ),
      ],
    );
  }
}
