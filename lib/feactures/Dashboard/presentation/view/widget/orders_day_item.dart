import 'package:flutter/material.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';

class OrderDayItem extends StatelessWidget {
  const OrderDayItem({super.key, required this.color, required this.day});
  final Color color;
  final String day;
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: ShapeDecoration(
            color: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ),
        Text(
          day,
          style: AppStayls.styleInterRegular14(
            context,
          ).copyWith(color: Colors.grey),
        ),
      ],
    );
  }
}
