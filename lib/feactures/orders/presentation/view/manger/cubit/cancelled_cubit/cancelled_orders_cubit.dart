import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:yumquickdashboard/core/service/get_cancelled_orders_service.dart';
import 'package:yumquickdashboard/feactures/orders/entity/active_orders_entity.dart';

part 'cancelled_orders_state.dart';

class CancelledOrdersCubit extends Cubit<CancelledOrdersState> {
  CancelledOrdersCubit() : super(CancelledOrdersInitial());
  final GetCancelledOrdersService getCancelledOrdersService =
      GetCancelledOrdersService();
  Future<void> fetchCancelledOrders() async {
    emit(CancelledOrdersLoading());
    try {
      final cancelledOrders =
          await getCancelledOrdersService.getCancelledOrders();
      if (cancelledOrders.isEmpty) {
        emit(CancelledOrdersEmpty());
      } else {
        emit(CancelledOrdersSuccess(cancelledOrders: cancelledOrders));
      }
    } catch (e) {
      emit(CancelledOrdersFeilure(errorMessage: e.toString()));
    }
  }
}
