import 'package:flutter/material.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';
import 'package:yumquickdashboard/core/widget/pick_image.dart';
import 'package:yumquickdashboard/core/widget/custom_text_filed.dart';
import 'package:yumquickdashboard/feactures/category/presentation/view/widget/edit_category_add_prodact_botton.dart';
import 'package:yumquickdashboard/feactures/category/presentation/view/widget/edit_category_prodact_item_list.dart';

class AddCategooryInformation extends StatelessWidget {
  const AddCategooryInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.77,
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Information',
              style: AppStayls.styleInterBold16(
                context,
              ).copyWith(color: AppColor.kDarkRed),
            ),
            SizedBox(height: 24),
            CustomTextFiled(
              helperText: 'Category Name',
              hintText: 'Category Name',
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.024),
            Divider(color: Colors.grey, thickness: 1),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.024),
            Text(
              'Images',
              style: AppStayls.styleInterBold16(
                context,
              ).copyWith(color: AppColor.kDarkRed),
            ),
            SizedBox(height: 24),
            PickImage(),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.024),
            Divider(color: Colors.grey),
            SizedBox(height: 20),
            EditCategoryProdactItemList(),
            SizedBox(height: 20),
            EditCategoryAddProdactBotton(width: double.infinity),
          ],
        ),
      ),
    );
  }
}
