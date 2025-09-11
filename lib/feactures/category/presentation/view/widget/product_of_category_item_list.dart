import 'package:flutter/material.dart';
import 'package:yumquickdashboard/feactures/Prodact/model/prodact_table_model.dart';
import 'package:yumquickdashboard/feactures/category/presentation/view/widget/product_of_category_item.dart';

class ProductOfCategoryItemList extends StatelessWidget {
  const ProductOfCategoryItemList({super.key, required this.productEntity});
  final List<ProductEntity> productEntity;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return ProductOfCategoryItem(product: productEntity[index]);
      },
    );
  }
}
