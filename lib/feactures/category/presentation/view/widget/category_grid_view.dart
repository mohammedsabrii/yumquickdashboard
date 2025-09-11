import 'package:flutter/material.dart';
import 'package:yumquickdashboard/core/utils/app_assets.dart';
import 'package:yumquickdashboard/core/utils/app_constant.dart';
import 'package:yumquickdashboard/feactures/category/model/category_model.dart';
import 'package:yumquickdashboard/feactures/category/presentation/view/widget/category_item.dart';

class CategoryGridView extends StatelessWidget {
  const CategoryGridView({super.key, this.onTap});
  final void Function(CategoryModel)? onTap;

  final List<CategoryModel> categorys = const [
    CategoryModel(
      id: mealId,
      name: 'Meal',
      imagePath: AppAssets.kMealCategoryImage,
      itemCount: 20,
    ),
    CategoryModel(
      id: veganId,
      name: 'Vegan',
      imagePath: AppAssets.kVagenCategoryImage,
      itemCount: 20,
    ),
    CategoryModel(
      id: snacksId,
      name: 'Snacks',
      imagePath: AppAssets.kSnacksCategoryImage,
      itemCount: 20,
    ),
    CategoryModel(
      id: dessertsId,
      name: 'Desserts',
      imagePath: AppAssets.kDessertsCategoryImage,
      itemCount: 20,
    ),
    CategoryModel(
      id: drinksId,
      name: 'Drinks',
      imagePath: AppAssets.kDrinksCategoryImage,
      itemCount: 20,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
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
