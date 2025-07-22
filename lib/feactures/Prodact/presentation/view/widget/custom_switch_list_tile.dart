import 'package:flutter/material.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';

class CustomSwitchListTile extends StatelessWidget {
  const CustomSwitchListTile({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start, // make sure alignment is left
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: AppStayls.styleInterRegular16(
            context,
          ).copyWith(color: AppColor.kDarkRed),
        ),
        Flexible(
          child: Transform.scale(
            scale: 0.7,
            child: SwitchListTile(
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
        ),
      ],
    );
  }
}
