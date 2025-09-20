import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';
import 'package:yumquickdashboard/feactures/Prodact/presentation/view/manger/cubits/products_cubit/products_cubit.dart';
import 'package:yumquickdashboard/feactures/Prodact/presentation/view/widget/empty_product_list.dart';
import 'package:yumquickdashboard/feactures/Prodact/presentation/view/widget/product_table.dart';

class ProdactListBlocBuilder extends StatelessWidget {
  const ProdactListBlocBuilder({super.key, this.onTap});
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ProductsCubit>(context).loadProducts();
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.876,
      width: MediaQuery.sizeOf(context).width * 0.77,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.sizeOf(context).height * 0.0218,
          horizontal: MediaQuery.sizeOf(context).width * 0.0194,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              BlocBuilder<ProductsCubit, ProductsState>(
                builder: (context, state) {
                  if (state is ProductsLoading) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: AppColor.kMainColor,
                      ),
                    );
                  } else if (state is ProductsSuccess) {
                    if (state.products.isNotEmpty) {
                      return ProductsTable(products: state.products);
                    } else {
                      return EmptyProductList(onTap: onTap);
                    }
                  } else if (state is ProductsFailure) {
                    return Center(
                      child: Text(
                        "Error: ${state.errorMessage}",
                        style: AppStayls.styleInterBold16(
                          context,
                        ).copyWith(color: AppColor.kDarkRed),
                      ),
                    );
                  }
                  return const SizedBox();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
