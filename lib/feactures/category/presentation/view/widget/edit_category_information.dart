import 'package:flutter/material.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';
import 'package:yumquickdashboard/feactures/category/presentation/view/widget/edit_category_add_prodact_botton.dart';
import 'package:yumquickdashboard/feactures/category/presentation/view/widget/edit_category_prodact_item_list.dart';

class CategoryEditInformation extends StatelessWidget {
  const CategoryEditInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.5,
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
            Row(
              spacing: 9,
              children: [
                Text(
                  'Products',
                  style: AppStayls.styleInterBold16(
                    context,
                  ).copyWith(color: AppColor.kDarkRed),
                ),
                Text(
                  '12',
                  style: AppStayls.styleInterRegular16(
                    context,
                  ).copyWith(color: AppColor.kDarkRed),
                ),
              ],
            ),
            SizedBox(height: 24),
            EditCategoryProdactItemList(),
            EditCategoryAddProdactBotton(),
          ],
        ),
      ),
    );
  }
}
