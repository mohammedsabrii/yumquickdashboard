import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yumquickdashboard/core/utils/app_assets.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';

class CustomersInformationViewHeader extends StatelessWidget {
  const CustomersInformationViewHeader({super.key, required this.onClose});

  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: onClose,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            spacing: 4,
            children: [
              SvgPicture.asset(AppAssets.kBackicon),
              Text(
                'Back',
                style: AppStayls.styleInterRegular14(
                  context,
                ).copyWith(color: AppColor.kDarkRed),
              ),
            ],
          ),
        ),
        Text(
          'Customer Information',
          style: AppStayls.styleInterBold24(
            context,
          ).copyWith(color: AppColor.kDarkRed),
        ),
      ],
    );
  }
}
