import 'package:flutter/material.dart';
import 'package:yumquickdashboard/feactures/category/presentation/view/widget/category_item.dart';

class CategoryGridView extends StatelessWidget {
  const CategoryGridView({super.key, this.onTap});
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 0,
        mainAxisExtent: 220,
      ),
      itemBuilder: (context, index) {
        return CategoryItem(onTap: onTap);
      },
      itemCount: 10,
    );
  }
}
