import 'package:flutter/material.dart';
import 'package:yumquickdashboard/feactures/category/model/category_model.dart';
import 'package:yumquickdashboard/feactures/category/presentation/view/widget/show_category_edit_view_body.dart';

class ProductOfCategory extends StatelessWidget {
  const ProductOfCategory({
    super.key,
    required this.onClose,
    required this.category,
  });
  final VoidCallback onClose;
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ShowCategoryEditViewBody(onClose: onClose, category: category),
      ),
    );
  }
}
