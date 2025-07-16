import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yumquickdashboard/core/utils/app_assets.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';

class DashboardHeader extends StatelessWidget {
  const DashboardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Dashboard', style: AppStayls.styleInterBold24(context)),
        Container(
          width: 129,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 7,
            children: [
              SvgPicture.asset(
                AppAssets.kGlobalSettingsIcon,
                color: AppColor.kMainColor,
              ),
              Flexible(
                child: Text(
                  'Manage',
                  style: AppStayls.styleInterRegular16(
                    context,
                  ).copyWith(color: AppColor.kDarkRed),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
