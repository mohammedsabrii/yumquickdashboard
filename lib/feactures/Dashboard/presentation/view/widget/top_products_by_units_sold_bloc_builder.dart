import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';
import 'package:yumquickdashboard/feactures/Dashboard/presentation/view/manger/cubit/get_top_selling_cubit/get_top_selling_cubit.dart';
import 'package:yumquickdashboard/feactures/Dashboard/presentation/view/widget/recent_transactions_empty.dart';
import 'package:yumquickdashboard/feactures/Dashboard/presentation/view/widget/top_products_by_units_sold_details.dart';

class TopProductsByUnitsSoldBlocBuilder extends StatelessWidget {
  const TopProductsByUnitsSoldBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetTopSellingCubit, GetTopSellingState>(
      builder: (context, state) {
        if (state is GetTopSellingEmpty) {
          return RecentTransactionsEmpty();
        } else if (state is GetTopSellingSuccess) {
          return TopProductsByUnitsSoldDetails(
            topSellingProducts: state.topSellingProducts,
          );
        } else if (state is GetTopSellingFailure) {
          return Center(
            child: Text(
              state.errorMessage,
              style: AppStayls.styleInterRegular16(
                context,
              ).copyWith(color: AppColor.kMainColor),
            ),
          );
        }
        return Center(
          child: CircularProgressIndicator(color: AppColor.kMainColor),
        );
      },
    );
  }
}
