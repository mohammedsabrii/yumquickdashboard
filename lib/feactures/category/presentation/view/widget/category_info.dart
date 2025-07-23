import 'package:flutter/material.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';
import 'package:yumquickdashboard/core/widget/pick_image.dart';
import 'package:yumquickdashboard/feactures/Prodact/presentation/view/widget/add_prodact_text_filed.dart';

class CategoryInfo extends StatelessWidget {
  const CategoryInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.24,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.sizeOf(context).height * 0.0169,
          horizontal: MediaQuery.sizeOf(context).width * 0.0194,
        ),
        child: Column(
          spacing: 24,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Category Visibility',
              style: AppStayls.styleInterBold16(
                context,
              ).copyWith(color: AppColor.kDarkRed),
            ),

            AddProdactTextFiled(
              helperText: 'category Name',
              hintText: 'Women Clothes',
            ),
            PickImage(),
          ],
        ),
      ),
    );
  }
}
