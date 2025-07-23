import 'package:flutter/material.dart';
import 'package:yumquickdashboard/feactures/category/presentation/view/widget/show_add_category_view_body.dart';

class ShowAddCategoryView extends StatelessWidget {
  const ShowAddCategoryView({super.key, required this.onClose});
  final VoidCallback onClose;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: ShowAddCategoryViewBody(onClose: onClose)),
    );
  }
}
