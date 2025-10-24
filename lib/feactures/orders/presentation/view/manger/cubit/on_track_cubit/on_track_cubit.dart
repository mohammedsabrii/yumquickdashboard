import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:yumquickdashboard/core/service/get_on_track_orders.dart';
import 'package:yumquickdashboard/feactures/orders/entity/active_orders_entity.dart';

part 'on_track_state.dart';

class OnTrackCubit extends Cubit<OnTrackState> {
  OnTrackCubit() : super(OnTrackInitial());
  final GetOnTrackOrders getOnTrackOrders = GetOnTrackOrders();
  Future<void> fetchOnTrackOrders() async {
    emit(OnTrackLoading());
    try {
      final onTrackOrders = await getOnTrackOrders.getOnTrackOrders();
      if (onTrackOrders.isEmpty) {
        emit(OnTrackEmpty());
      } else {
        emit(OnTrackSuccess(onTrackOrders: onTrackOrders));
      }
    } catch (e) {
      emit(OnTrackFailure(errorMessage: e.toString()));
    }
  }

  Future<void> moveOrderToCompletedTable(
    BuildContext context,
    String orderId,
    OrdersEntity activeOrder,
  ) async {
    final supabase = Supabase.instance.client;
    emit(OnTrackLoading());
    try {
      await supabase.from('completed_orders').insert({
        'user_id': activeOrder.userId,
        'product_id': activeOrder.product.id,
        'quantity': activeOrder.quantity,
        'total_amount': activeOrder.totalAmount,
        'customer_name': activeOrder.customerName,
        'customer_address': activeOrder.customerAddress,
        'created_at': activeOrder.createdAt.toString(),
      });

      await supabase.from('on_track_orders').delete().eq('id', activeOrder.id!);

      await supabase.functions.invoke(
        'yumquick_notifications',
        body: {
          'user_id': activeOrder.userId,
          'title': 'Your order has been delivered!',
          'body':
              'Your order has been delivered successfully. Thank you for your business.',
          'screen': 'MyOrders',
          'product_id': activeOrder.product.id,
        },
      );

      fetchOnTrackOrders();
    } catch (e) {
      emit(OnTrackFailure(errorMessage: e.toString()));
    }
  }
}
