import 'package:flutter/material.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';

void customShowSnackBar(BuildContext context, {required String title}) {
  var snackBar = SnackBar(
    width: MediaQuery.sizeOf(context).width * 0.7,
    content: Text(
      title,
      style: AppStayls.styleInterBold16(
        context,
      ).copyWith(color: AppColor.kDarkRed),
    ),
    backgroundColor: AppColor.kPinkishOrange.withOpacity(0.8),
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    // margin: const EdgeInsets.all(16),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
