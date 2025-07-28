import 'package:flutter/material.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';

class AppStayls {
  static TextStyle styleInerRegular10(context) {
    return TextStyle(
      color: const Color(0xFF5A607F),
      fontSize: 10,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w400,
    );
  }

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

  static TextStyle styleInterBold14(context) {
    return const TextStyle(
      fontSize: 14,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle styleInterBold16(context) {
    return const TextStyle(
      fontSize: 16,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle styleInterBold18(context) {
    return const TextStyle(
      fontSize: 18,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle styleInterBold20(context) {
    return const TextStyle(
      fontSize: 20,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w700,
      height: 1.40,
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

  static TextStyle styleInterBold32(context) {
    return const TextStyle(
      fontSize: 32,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w700,
    );
  }
}
