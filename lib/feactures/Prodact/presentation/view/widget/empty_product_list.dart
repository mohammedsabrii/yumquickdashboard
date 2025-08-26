import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yumquickdashboard/core/utils/app_assets.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';
import 'package:yumquickdashboard/core/widget/custom_container.dart';

class EmptyProductList extends StatelessWidget {
  const EmptyProductList({super.key, this.onTap});
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.77,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.sizeOf(context).height * 0.0218,
          horizontal: MediaQuery.sizeOf(context).width * 0.0194,
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(AppAssets.kEmptyProductList),
            SizedBox(height: 24),
            Text(
              'Add Products',
              textAlign: TextAlign.center,
              style: AppStayls.styleInterBold20(
                context,
              ).copyWith(color: AppColor.kDarkRed),
            ),
            SizedBox(height: 12),
            Text(
              'Start making sales by adding your products.\nYou can import and manage your products at any time.',
              textAlign: TextAlign.center,
              style: AppStayls.styleInterRegular16(
                context,
              ).copyWith(color: Colors.grey),
            ),
            SizedBox(height: 24),
            CustomContainer(title: 'Add Product', onTap: onTap),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
