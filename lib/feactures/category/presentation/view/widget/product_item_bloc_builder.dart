import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/feactures/Prodact/presentation/view/widget/edit_product_dialog.dart';
import 'package:yumquickdashboard/feactures/Prodact/presentation/view/widget/show_dialog_method.dart';
import 'package:yumquickdashboard/feactures/category/manger/cubit/cubit/category_product_cubit.dart';
import 'package:yumquickdashboard/feactures/category/presentation/view/widget/product_of_category_item.dart';

class ProductItemBlocBuilder extends StatelessWidget {
  const ProductItemBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsByCategoryCubit, ProductsByCategoryState>(
      builder: (context, state) {
        if (state is ProductsByCategoryLoading) {
          return const Center(
            child: CircularProgressIndicator(color: AppColor.kMainColor),
          );
        } else if (state is ProductsByCategorySuccess) {
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.products.length,
            itemBuilder: (context, index) {
              return ProductOfCategoryItem(
                deleteIcononTap: () {
                  showDialog(
                    context: context,
                    builder:
                        (context) => ShowDeleteProductDialog(
                          id: state.products[index].id,
                        ),
                  );
                },
                editIcononTap: () {
                  showDialog(
                    context: context,
                    builder:
                        (context) => EditProductDialog(
                          productEntity: state.products[index],
                        ),
                  );
                },
                product: state.products[index],
              );
            },
          );
        } else if (state is ProductsByCategoryFailure) {
          return Text('Error: ${state.errorMessage}');
        }
        return const Text('No products found');
      },
    );
  }
}
