import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';
import 'package:yumquickdashboard/feactures/Prodact/presentation/view/manger/cubits/products_cubit/products_cubit.dart';
import 'package:yumquickdashboard/feactures/Prodact/presentation/view/widget/product_table.dart';

class ProdactList extends StatelessWidget {
  const ProdactList({super.key});

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'All Products',
                style: AppStayls.styleInterBold20(
                  context,
                ).copyWith(color: AppColor.kDarkRed),
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.0145),

              BlocBuilder<ProductsCubit, ProductsState>(
                builder: (context, state) {
                  if (state is ProductsLoading) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: AppColor.kMainColor,
                      ),
                    );
                  } else if (state is ProductsSuccess) {
                    return ProductsTable(products: state.products);
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
