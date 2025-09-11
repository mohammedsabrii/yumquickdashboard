import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';
import 'package:yumquickdashboard/feactures/category/manger/cubit/cubit/category_product_cubit.dart';

class NumberOfProductsBlocBuilder extends StatelessWidget {
  const NumberOfProductsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsByCategoryCubit, ProductsByCategoryState>(
      builder: (context, state) {
        if (state is ProductsByCategorySuccess) {
          return Text(
            'Products  ( ${state.products.length} )',
            style: AppStayls.styleInterRegular16(
              context,
            ).copyWith(color: AppColor.kDarkRed),
          );
        }
        return Text(
          'Products   ( 0 )',
          style: AppStayls.styleInterRegular16(
            context,
          ).copyWith(color: AppColor.kDarkRed),
        );
      },
    );
  }
}
