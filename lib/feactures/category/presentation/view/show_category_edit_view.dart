import 'package:flutter/material.dart';
import 'package:yumquickdashboard/feactures/category/presentation/view/widget/show_category_edit_view_body.dart';

class ShowCategoryEditView extends StatelessWidget {
  const ShowCategoryEditView({super.key, required this.onClose});
  final VoidCallback onClose;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: ShowCategoryEditViewBody(onClose: onClose)),
    );
  }
}
