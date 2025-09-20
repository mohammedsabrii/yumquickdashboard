part of 'customers_profile_info_cubit.dart';

@immutable
sealed class CustomersProfileInfoState {}

final class CustomersProfileInfoInitial extends CustomersProfileInfoState {}

final class CustomersProfileInfoSuccess extends CustomersProfileInfoState {
  final List<CustomerEntity> customers;

  CustomersProfileInfoSuccess({required this.customers});
}

final class CustomersProfileInfoLoading extends CustomersProfileInfoState {}

final class CustomersProfileInfoFailure extends CustomersProfileInfoState {
  final String errorMessage;

  CustomersProfileInfoFailure({required this.errorMessage});
}
