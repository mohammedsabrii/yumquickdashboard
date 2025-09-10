import 'package:flutter/material.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';
import 'package:yumquickdashboard/feactures/category/presentation/view/show_category_edit_view.dart';
import 'package:yumquickdashboard/feactures/category/presentation/view/widget/category_grid_view.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({super.key});

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  bool showAddCategory = false;
  bool showCategoryEditView = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: MediaQuery.sizeOf(context).height * 0.027,
              horizontal: MediaQuery.sizeOf(context).width * 0.027,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Categorys',
                      style: AppStayls.styleInterBold24(context),
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.027),
                CategoryGridView(
                  onTap: () {
                    setState(() {
                      showCategoryEditView = true;
                    });
                  },
                ),
              ],
            ),
          ),
        ),

        if (showCategoryEditView)
          Positioned.fill(
            child: ShowCategoryEditView(
              onClose: () {
                setState(() {
                  showCategoryEditView = false;
                });
              },
            ),
          ),
      ],
    );
  }
}
