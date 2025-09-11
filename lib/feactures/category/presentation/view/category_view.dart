import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';
import 'package:yumquickdashboard/feactures/category/manger/cubit/cubit/category_product_cubit.dart';
import 'package:yumquickdashboard/feactures/category/model/category_model.dart';
import 'package:yumquickdashboard/feactures/category/presentation/view/product_of_category_view.dart';
import 'package:yumquickdashboard/feactures/category/presentation/view/widget/category_grid_view.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({super.key});

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  bool showAddCategory = false;
  bool showCategoryEditView = false;
  CategoryModel? selectedCategory;

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
                  onTap: (CategoryModel category) {
                    setState(() {
                      showCategoryEditView = true;
                      selectedCategory = category;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
        if (showCategoryEditView && selectedCategory != null)
          Positioned.fill(
            child: BlocProvider(
              create:
                  (context) =>
                      ProductsByCategoryCubit()
                        ..fetchProductsByCategory(selectedCategory!.id),
              child: ProductOfCategory(
                onClose: () {
                  setState(() {
                    showCategoryEditView = false;
                    selectedCategory = null;
                  });
                },
                category: selectedCategory!,
              ),
            ),
          ),
      ],
    );
  }
}
