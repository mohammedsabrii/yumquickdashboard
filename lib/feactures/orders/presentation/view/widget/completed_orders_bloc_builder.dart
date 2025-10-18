import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';
import 'package:yumquickdashboard/feactures/orders/presentation/view/manger/cubit/completed_orders_cubit/completed_orders_cubit.dart';
import 'package:yumquickdashboard/feactures/orders/presentation/view/widget/completed_orders_more_details_dialog.dart';
import 'package:yumquickdashboard/feactures/orders/presentation/view/widget/order_empty.dart';
import 'package:yumquickdashboard/feactures/orders/presentation/view/widget/order_table.dart';

class CompletedOrdersBlocBuilder extends StatelessWidget {
  const CompletedOrdersBlocBuilder({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CompletedOrdersCubit, CompletedOrdersState>(
      builder: (context, state) {
        if (state is CompletedOrdersSuccess) {
          return OrderTable(
            activeOrderEntity: state.completedOrders,
            detailsDialog:
                (context, index) => CompletedOrdersMoreDetailsDialog(
                  id: state.completedOrders[index].id!,
                  activeOrderEntity: state.completedOrders[index],
                ),
          );
        } else if (state is CompletedOrdersFailure) {
          return Text(
            state.errorMessage,
            style: AppStayls.styleLeagueSpartanMediem17(
              context,
            ).copyWith(color: Colors.red),
          );
        } else if (state is CompletedOrdersEmpty) {
          return Center(child: OrderEmpty());
        }
        return Center(
          child: CircularProgressIndicator(color: AppColor.kMainColor),
        );
      },
    );
  }
}
