import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';
import 'package:yumquickdashboard/feactures/Offers/presentation/view/widget/empty_offer_list_view.dart';
import 'package:yumquickdashboard/feactures/Offers/presentation/view/widget/offers_list.dart';
import 'package:yumquickdashboard/feactures/Prodact/presentation/view/manger/cubits/products_cubit/products_cubit.dart';

class OfffersViewBodyBlocBuilder extends StatelessWidget {
  const OfffersViewBodyBlocBuilder({super.key, this.onTap});
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsLoading) {
          return Center(
            child: CircularProgressIndicator(color: AppColor.kMainColor),
          );
        } else if (state is ProductsSuccess) {
          final discountedProducts =
              state.products
                  .where((product) => product.priceAfterDiscount != null)
                  .toList();

          if (discountedProducts.isNotEmpty) {
            return OffersList(offers: discountedProducts);
          } else {
            return EmptyOfferListView(onTap: onTap);
          }
        } else if (state is ProductsFailure) {
          return Text(
            state.errorMessage,
            style: AppStayls.styleInterBold20(
              context,
            ).copyWith(color: AppColor.kDarkRed),
          );
        }

        return Center(
          child: const CircularProgressIndicator(color: AppColor.kMainColor),
        );
      },
    );
  }
}
