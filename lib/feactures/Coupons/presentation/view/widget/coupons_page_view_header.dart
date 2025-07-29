import 'package:flutter/material.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';

class CouponsPageViewHeader extends StatelessWidget {
  const CouponsPageViewHeader({
    super.key,
    required this.isActive,
    required this.title,
    required this.onTap,
  });
  final bool isActive;
  final String title;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return isActive
        ? Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Container(
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: AppColor.kMainColor)),
            ),
            child: Text(
              title,
              style: AppStayls.styleInterRegular16(
                context,
              ).copyWith(color: AppColor.kMainColor),
            ),
          ),
        )
        : GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Text(
              title,
              style: AppStayls.styleInterRegular16(
                context,
              ).copyWith(color: AppColor.kDarkRed),
            ),
          ),
        );
  }
}
