import 'package:flutter/material.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';

class AddProdactCategoryItem extends StatelessWidget {
  const AddProdactCategoryItem({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          side: BorderSide(color: Colors.grey),
          value: false,
          onChanged: (value) {},
        ),
        Text(
          title,
          style: AppStayls.styleInterRegular16(
            context,
          ).copyWith(color: AppColor.kDarkRed),
        ),
      ],
    );
  }
}
