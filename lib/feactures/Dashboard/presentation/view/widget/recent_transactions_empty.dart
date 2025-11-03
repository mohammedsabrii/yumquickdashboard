import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yumquickdashboard/core/utils/app_assets.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';

class RecentTransactionsEmpty extends StatelessWidget {
  const RecentTransactionsEmpty({super.key, this.onTap});
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.sizeOf(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: mq.height * 0.0218,
        horizontal: mq.width * 0.0194,
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(AppAssets.kEmptyProductList),
          SizedBox(height: mq.height * 0.03),
          Text(
            'No Products Yet',
            textAlign: TextAlign.center,
            style: AppStayls.styleInterBold20(
              context,
            ).copyWith(color: AppColor.kDarkRed),
          ),
          SizedBox(height: 12),
        ],
      ),
    );
  }
}
