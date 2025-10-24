import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:yumquickdashboard/core/service/get_orders_service.dart';
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

  Future<void> moveOrderToOnTrackTable(
    BuildContext context,
    String orderId,
    OrdersEntity activeOrder,
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
      await supabase.functions.invoke(
        'yumquick_notifications',
        body: {
          'user_id': activeOrder.userId,
          'title': 'Your order is on the way',
          'body': 'Your order is on its way now, only a little time left ',
          'image_url': activeOrder.product.image,
          'screen': 'MyOrders',
          'product_id': activeOrder.product.id,
        },
      );
      await supabase.from('active_orders').delete().eq('id', activeOrder.id!);
      fetchActiveOrders();
    } catch (e) {
      emit(ActiveOrdersFailure(e.toString()));
    }
  }
}
