import 'package:flutter/material.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';

class AddProdactCategoryItem extends StatelessWidget {
  const AddProdactCategoryItem({
    super.key,
    required this.title,

    required this.isSelected,
    required this.onChanged,
  });

  final String title;

  final bool isSelected;
  final ValueChanged<bool?> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          side: BorderSide(color: Colors.grey),
          value: isSelected,
          onChanged: onChanged,
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
