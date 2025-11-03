import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';
import 'package:yumquickdashboard/feactures/Dashboard/presentation/view/widget/recent_transactions_details.dart';
import 'package:yumquickdashboard/feactures/Dashboard/presentation/view/widget/recent_transactions_empty.dart';
import 'package:yumquickdashboard/feactures/orders/presentation/view/manger/cubit/completed_orders_cubit/completed_orders_cubit.dart';

class RecentTransactionsBlocBuilder extends StatelessWidget {
  const RecentTransactionsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CompletedOrdersCubit, CompletedOrdersState>(
      builder: (context, state) {
        if (state is CompletedOrdersSuccess) {
          return RecentTransactionsDetails(
            transactionsOrders: state.completedOrders,
          );
        } else if (state is CompletedOrdersEmpty) {
          return RecentTransactionsEmpty();
        } else if (state is CompletedOrdersFailure) {
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
