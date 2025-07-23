import 'package:flutter/material.dart';
import 'package:yumquickdashboard/feactures/category/presentation/view/widget/edit_category_prodact_item.dart';

class EditCategoryProdactItemList extends StatelessWidget {
  const EditCategoryProdactItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return EditCategoryPordactItem();
      },
    );
  }
}
