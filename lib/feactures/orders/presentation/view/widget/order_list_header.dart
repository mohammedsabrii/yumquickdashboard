import 'package:flutter/material.dart';
import 'package:yumquickdashboard/core/utils/app_assets.dart';
import 'package:yumquickdashboard/core/widget/action_item.dart';
import 'package:yumquickdashboard/core/widget/custom_drop_button.dart';
import 'package:yumquickdashboard/core/widget/custom_search_text_fild.dart';

class OrderListHeader extends StatelessWidget {
  const OrderListHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 40,
          width: MediaQuery.sizeOf(context).width * 0.125,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            border: Border.all(color: Colors.grey),
          ),
          child: CustomDropButton(),
        ),
        SizedBox(width: 12),
        CustomSearchTextFild(),
        Spacer(),
        ActionItem(icon: AppAssets.kEditIcon),
        SizedBox(width: 12),
        ActionItem(icon: AppAssets.kDeleteicon),
      ],
    );
  }
}
