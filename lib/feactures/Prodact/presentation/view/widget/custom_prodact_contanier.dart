import 'package:flutter/material.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';

class CustomButtom extends StatelessWidget {
  const CustomButtom({
    super.key,
    this.backgroundColor,
    this.textColor,
    required this.title,
    this.onTap,
    this.width,
  });
  final Color? backgroundColor, textColor;
  final String title;
  final Function()? onTap;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? MediaQuery.sizeOf(context).width * 0.0597,
        height: 30,
        decoration: ShapeDecoration(
          color: backgroundColor ?? AppColor.kMainColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
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
