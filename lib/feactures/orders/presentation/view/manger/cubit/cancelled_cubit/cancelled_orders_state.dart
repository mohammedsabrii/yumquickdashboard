part of 'cancelled_orders_cubit.dart';

@immutable
sealed class CancelledOrdersState {}

final class CancelledOrdersInitial extends CancelledOrdersState {}

final class CancelledOrdersSuccess extends CancelledOrdersState {
  final List<OrdersEntity> cancelledOrders;

  CancelledOrdersSuccess({required this.cancelledOrders});
}

final class CancelledOrdersFeilure extends CancelledOrdersState {
  final String errorMessage;

  CancelledOrdersFeilure({required this.errorMessage});
}

final class CancelledOrdersLoading extends CancelledOrdersState {}

final class CancelledOrdersEmpty extends CancelledOrdersState {}
