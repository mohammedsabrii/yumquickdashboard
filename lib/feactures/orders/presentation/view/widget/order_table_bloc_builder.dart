import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';
import 'package:yumquickdashboard/feactures/Prodact/presentation/view/widget/empty_product_list.dart';
import 'package:yumquickdashboard/feactures/orders/presentation/view/manger/cubit/active_orders_cubit/active_orders_cubit.dart';
import 'package:yumquickdashboard/feactures/orders/presentation/view/widget/order_table.dart';

class OrdersTableBlocBuilder extends StatelessWidget {
  const OrdersTableBlocBuilder({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ActiveOrdersCubit, ActiveOrdersState>(
      builder: (context, state) {
        if (state is ActiveOrdersSuccess) {
          return OrderTable(activeOrderEntity: state.orders);
        } else if (state is ActiveOrdersFailure) {
          return Text(
            state.errorMessage,
            style: AppStayls.styleLeagueSpartanMediem17(
              context,
            ).copyWith(color: Colors.red),
          );
        } else if (state is ActiveOrdersEmpty) {
          return EmptyProductList();
        }
        return Center(
          child: CircularProgressIndicator(color: AppColor.kMainColor),
        );
      },
    );
  }
}
