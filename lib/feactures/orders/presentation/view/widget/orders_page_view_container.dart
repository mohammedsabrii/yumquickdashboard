import 'package:flutter/material.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';

class OrdersPageViewContainer extends StatelessWidget {
  const OrdersPageViewContainer({
    super.key,
    required this.title,
    required this.isActive,
  });
  final String title;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.sizeOf(context);

    return Container(
      width: mediaQuery.width * 0.13,
      height: mediaQuery.height * 0.03685,
      decoration: ShapeDecoration(
        color: isActive ? AppColor.kMainColor : AppColor.kPinkishOrange,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(38)),
      ),
      child: Center(
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: AppStayls.styleLeagueSpartanMediem17(context).copyWith(
            color: isActive ? AppColor.kCultured : AppColor.kMainColor,
          ),
        ),
      ),
    );
  }
}
