import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yumquickdashboard/core/utils/app_assets.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';

class EditCategoryPordactItem extends StatelessWidget {
  const EditCategoryPordactItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey),
        ),
        child: Row(
          children: [
            SvgPicture.asset(AppAssets.kDotIcon),
            SizedBox(height: 10),
            Image.asset(AppAssets.kImageTest, width: 55, height: 48),
            SizedBox(height: 20),
            Text(
              'Women Striped T-Shirt',
              style: AppStayls.styleInterRegular14(
                context,
              ).copyWith(color: AppColor.kDarkRed),
            ),
          ],
        ),
      ),
    );
  }
}
