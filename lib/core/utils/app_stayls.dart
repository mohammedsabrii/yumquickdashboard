import 'package:flutter/material.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';

class AppStayls {
  static TextStyle styleInterRegular12(context) {
    return TextStyle(
      color: Colors.white,
      fontSize: 12,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle styleInterRegular14(context) {
    return const TextStyle(
      color: Colors.white,
      fontSize: 14,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle styleInterRegular16(context) {
    return const TextStyle(
      fontSize: 16,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle styleInterBold24(context) {
    return const TextStyle(
      color: AppColor.kDarkRed,
      fontSize: 24,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w700,
    );
  }
}
