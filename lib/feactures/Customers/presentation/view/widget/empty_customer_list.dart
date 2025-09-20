import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yumquickdashboard/core/utils/app_assets.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';

class EmptyCustomerList extends StatelessWidget {
  const EmptyCustomerList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: MediaQuery.sizeOf(context).height * 0.0218,
        horizontal: MediaQuery.sizeOf(context).width * 0.0194,
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(AppAssets.kEmptyCustomerList),
          SizedBox(height: 24),
          Text(
            'No Customers Yet',
            textAlign: TextAlign.center,
            style: AppStayls.styleInterBold20(
              context,
            ).copyWith(color: AppColor.kDarkRed),
          ),
          SizedBox(height: 12),
          Text(
            'Having a customer list helps to know your audience better.\nManage your customers in one place and target your audinece better.',
            textAlign: TextAlign.center,
            style: AppStayls.styleInterRegular16(
              context,
            ).copyWith(color: Colors.grey),
          ),

          SizedBox(height: 50),
        ],
      ),
    );
  }
}
