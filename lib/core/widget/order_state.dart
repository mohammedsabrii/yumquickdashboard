import 'package:flutter/material.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';

class OrderStatus extends StatelessWidget {
  const OrderStatus({super.key, required this.isActive});
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: isActive ? 58 : 71,
      height: 24,
      decoration: ShapeDecoration(
        color: isActive ? AppColor.kYellowBase : const Color(0xFF595F7E),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
      child: Text(
        isActive ? 'Ready' : 'Shipped',
        textAlign: TextAlign.center,
        style: AppStayls.styleInterRegular16(
          context,
        ).copyWith(color: Colors.white),
      ),
    );
  }
}
