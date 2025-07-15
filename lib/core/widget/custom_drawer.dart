import 'package:flutter/material.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: MediaQuery.sizeOf(context).width * 0.25,
      color: AppColor.kMainColor,
      child: child,
    );
  }
}
