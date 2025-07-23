import 'package:flutter/material.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';

class CustomSwitch extends StatelessWidget {
  const CustomSwitch({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Transform.scale(
          scale: 0.7,
          child: Switch(
            activeTrackColor: AppColor.kMainColor,
            inactiveTrackColor: AppColor.kPinkishOrange,
            trackOutlineColor: WidgetStateProperty.all<Color>(
              Colors.transparent,
            ),
            activeColor: AppColor.kCultured,
            inactiveThumbColor: AppColor.kCultured,
            value: true,
            onChanged: (value) {},
          ),
        ),
        Text(
          title,
          style: AppStayls.styleInterRegular16(
            context,
          ).copyWith(color: AppColor.kDarkRed),
        ),
      ],
    );
  }
}
