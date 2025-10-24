import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';
import 'package:yumquickdashboard/feactures/Dashboard/presentation/view/widget/custom_table_recent_transactions_row_header_method.dart';
import 'package:yumquickdashboard/feactures/Dashboard/presentation/view/widget/custom_tebl_row_method.dart';
import 'package:yumquickdashboard/feactures/orders/presentation/view/manger/cubit/completed_orders_cubit/completed_orders_cubit.dart';
import 'package:yumquickdashboard/feactures/orders/presentation/view/widget/order_empty.dart';

class RecentTransactions extends StatelessWidget {
  const RecentTransactions({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.375,
      height: MediaQuery.sizeOf(context).height * 0.47,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.sizeOf(context).height * 0.035,
          horizontal: MediaQuery.sizeOf(context).width * 0.0194,
        ),
        child: BlocBuilder<CompletedOrdersCubit, CompletedOrdersState>(
          builder: (context, state) {
            if (state is CompletedOrdersSuccess) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Recent Transactions',
                      style: AppStayls.styleInterBold16(
                        context,
                      ).copyWith(color: AppColor.kDarkRed),
                    ),
                    SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
                    Table(
                      children: [
                        customTableRecentTransactionsRowHeader(context),
                        ...List.generate(
                          5,
                          (index) => customTableRecentTransactionsRow(
                            context,
                            ordersEntity: state.completedOrders[index],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            } else if (state is CompletedOrdersEmpty) {
              return OrderEmpty();
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
        ),
      ),
    );
  }
}
