import 'package:flutter/material.dart';
import 'package:yumquickdashboard/feactures/category/model/category_model.dart';
import 'package:yumquickdashboard/feactures/category/presentation/view/widget/Product_item_bloc_builder.dart';
import 'package:yumquickdashboard/feactures/category/presentation/view/widget/product_of_category_add_prodact_botton.dart';
import 'package:yumquickdashboard/feactures/category/presentation/view/widget/number_of_products_bloc_builder.dart';

class ProductOfCategoryInformation extends StatelessWidget {
  const ProductOfCategoryInformation({
    super.key,
    required this.category,
    required this.pushToAddProdactView,
  });
  final CategoryModel category;
  final Function() pushToAddProdactView;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.sizeOf(context).height * 0.0169,
          horizontal: MediaQuery.sizeOf(context).width * 0.0194,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NumberOfProductsBlocBuilder(),
            SizedBox(height: 24),
            ProductItemBlocBuilder(),
            SizedBox(height: 20),
            ProductOfCategoryAddProdactBotton(
              pushToAddProdactView: pushToAddProdactView,
              width: MediaQuery.sizeOf(context).width,
            ),
          ],
        ),
      ),
    );
  }
}
