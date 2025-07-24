import 'package:flutter/material.dart';
import 'package:yumquickdashboard/core/utils/app_assets.dart';
import 'package:yumquickdashboard/core/widget/action_item.dart';
import 'package:yumquickdashboard/core/widget/custom_drop_button.dart';
import 'package:yumquickdashboard/core/widget/custom_search_text_fild.dart';

class FliterSearchEditAndDeleteHeader extends StatelessWidget {
  const FliterSearchEditAndDeleteHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomDropButton(),
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
