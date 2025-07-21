import 'package:flutter/material.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';
import 'package:yumquickdashboard/core/widget/custom_container.dart';
import 'package:yumquickdashboard/feactures/Prodact/presentation/view/add_prodact_view.dart';
import 'package:yumquickdashboard/feactures/category/presentation/view/widget/category_grid_view.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({super.key});

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  bool showAddCategory = false;
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
                    Spacer(),
                    CustomContainer(
                      title: 'Add category',
                      onTap: () {
                        setState(() {
                          showAddCategory = true;
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.027),
                CategoryGridView(),
              ],
            ),
          ),
        ),
        if (showAddCategory)
          Positioned.fill(
            child: AddProdactView(
              onClose: () {
                setState(() {
                  showAddCategory = false;
                });
              },
            ),
          ),
      ],
    );
  }
}
