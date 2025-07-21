import 'package:flutter/material.dart';
import 'package:yumquickdashboard/feactures/category/presentation/view/widget/category_item.dart';

class CategoryGridView extends StatelessWidget {
  const CategoryGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        return const CategoryItem();
      },
      itemCount: 10,
    );
  }
}
