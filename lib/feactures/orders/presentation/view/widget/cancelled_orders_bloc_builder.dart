import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';
import 'package:yumquickdashboard/feactures/orders/presentation/view/manger/cubit/cancelled_cubit/cancelled_orders_cubit.dart';
import 'package:yumquickdashboard/feactures/orders/presentation/view/widget/cancelled_order_empty.dart';
import 'package:yumquickdashboard/feactures/orders/presentation/view/widget/completed_orders_more_details_dialog.dart';
import 'package:yumquickdashboard/feactures/orders/presentation/view/widget/order_table.dart';

class CancelledOrdersBlocBuilder extends StatelessWidget {
  const CancelledOrdersBlocBuilder({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CancelledOrdersCubit, CancelledOrdersState>(
      builder: (context, state) {
        if (state is CancelledOrdersSuccess) {
          return OrderTable(
            activeOrderEntity: state.cancelledOrders,
            detailsDialog:
                (context, index) => CompletedOrdersMoreDetailsDialog(
                  id: state.cancelledOrders[index].id!,
                  activeOrderEntity: state.cancelledOrders[index],
                ),
          );
        } else if (state is CancelledOrdersFeilure) {
          return Text(
            state.errorMessage,
            style: AppStayls.styleLeagueSpartanMediem17(
              context,
            ).copyWith(color: Colors.red),
          );
        } else if (state is CancelledOrdersEmpty) {
          return Center(child: CancelledOrderEmpty());
        }
        return Center(
          child: CircularProgressIndicator(color: AppColor.kMainColor),
        );
      },
    );
  }
}
