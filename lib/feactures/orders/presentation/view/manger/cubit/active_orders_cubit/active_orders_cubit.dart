import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:yumquickdashboard/core/service/get_orders_service.dart';
import 'package:yumquickdashboard/core/widget/custom_show_snackbar.dart';
import 'package:yumquickdashboard/feactures/orders/entity/active_orders_entity.dart';

part 'active_orders_state.dart';

class ActiveOrdersCubit extends Cubit<ActiveOrdersState> {
  ActiveOrdersCubit() : super(ActiveOrdersInitial());
  final GetOrdersService getOrdersService = GetOrdersService();
  final supabase = Supabase.instance.client;
  Future<void> fetchActiveOrders() async {
    emit(ActiveOrdersLoading());

    try {
      final orders = await getOrdersService.getActiveOrders();
      if (orders.isEmpty) {
        emit(ActiveOrdersEmpty());
      } else {
        emit(ActiveOrdersSuccess(orders));
      }
    } catch (e) {
      emit(ActiveOrdersFailure(e.toString()));
    }
  }

  Future<void> moveOrderToAnotherTable(
    String orderId,
    ActiveOrderEntity activeOrder,
  ) async {
    final supabase = Supabase.instance.client;
    emit(ActiveOrdersLoading());
    try {
      await supabase.from('on_track_orders').insert({
        'user_id': activeOrder.userId,
        'product_id': activeOrder.product.id,
        'quantity': activeOrder.quantity,
        'total_amount': activeOrder.totalAmount,
        'customer_name': activeOrder.customerName,
        'customer_address': activeOrder.customerAddress,
        'created_at': activeOrder.createdAt.toString(),
      });

      await supabase.from('active_orders').delete().eq('id', activeOrder.id!);
      customShowSnackBar(title: 'Order moved successfully');
    } catch (e) {
      customShowSnackBar(title: e.toString());
    }
  }
}
