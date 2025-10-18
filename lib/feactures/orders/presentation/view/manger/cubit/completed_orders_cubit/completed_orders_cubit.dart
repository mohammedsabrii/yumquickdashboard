import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:yumquickdashboard/core/service/get_completed_orders_service.dart';
import 'package:yumquickdashboard/feactures/orders/entity/active_orders_entity.dart';

part 'completed_orders_state.dart';

class CompletedOrdersCubit extends Cubit<CompletedOrdersState> {
  CompletedOrdersCubit() : super(CompletedOrdersInitial());
  final GetCompletedOrdersService getCompletedOrdersService =
      GetCompletedOrdersService();
  Future<void> fetchCompletedOrders() async {
    emit(CompletedOrdersLoading());
    try {
      final completedOrders =
          await getCompletedOrdersService.getCompletedOrders();
      if (completedOrders.isEmpty) {
        emit(CompletedOrdersEmpty());
      } else {
        emit(CompletedOrdersSuccess(completedOrders: completedOrders));
      }
    } catch (e) {
      emit(CompletedOrdersFailure(errorMessage: e.toString()));
    }
  }
}
