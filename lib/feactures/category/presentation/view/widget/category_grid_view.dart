import 'package:flutter/material.dart';
import 'package:yumquickdashboard/core/utils/app_assets.dart';
import 'package:yumquickdashboard/feactures/category/model/category_model.dart';
import 'package:yumquickdashboard/feactures/category/presentation/view/widget/category_item.dart';

class CategoryGridView extends StatelessWidget {
  const CategoryGridView({super.key, this.onTap});
  final Function()? onTap;
  final List<CategoryModel> categorys = const [
    CategoryModel(
      name: 'Meal',
      imagePath: AppAssets.kMealCategoryImage,
      itemCount: 20,
    ),
    CategoryModel(
      name: 'Vagen',
      imagePath: AppAssets.kVagenCategoryImage,
      itemCount: 20,
    ),
    CategoryModel(
      name: 'Snacks',
      imagePath: AppAssets.kSnacksCategoryImage,
      itemCount: 20,
    ),
    CategoryModel(
      name: 'Desserts',
      imagePath: AppAssets.kDessertsCategoryImage,
      itemCount: 20,
    ),
    CategoryModel(
      name: 'Drinks',
      imagePath: AppAssets.kDrinksCategoryImage,
      itemCount: 20,
    ),
  ];
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
        return CategoryItem(onTap: onTap, categoryModel: categorys[index]);
      },
      itemCount: categorys.length,
    );
  }
}
