import 'package:flutter/material.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';

class CustomProdactContainer extends StatelessWidget {
  const CustomProdactContainer({
    super.key,
    this.backgroundColor,
    this.textColor,
    required this.title,
    this.onTap,
  });
  final Color? backgroundColor, textColor;
  final String title;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.0597,
        height: 30,
        decoration: ShapeDecoration(
          color: backgroundColor ?? AppColor.kMainColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: AppStayls.styleInterRegular14(
              context,
            ).copyWith(color: textColor ?? Colors.white),
          ),
        ),
      ),
    );
  }
}
