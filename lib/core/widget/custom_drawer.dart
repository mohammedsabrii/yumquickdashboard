import 'package:flutter/material.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.173,
        color: AppColor.kMainColor,
        child: Column(children: [SizedBox(height: 16)]),
      ),
    );
  }
}
