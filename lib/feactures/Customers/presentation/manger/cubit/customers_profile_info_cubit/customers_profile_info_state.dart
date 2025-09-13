part of 'customers_profile_info_cubit.dart';

@immutable
sealed class CustomersProfileInfoState {}

final class CustomersProfileInfoInitial extends CustomersProfileInfoState {}

final class CustomersProfileInfoSuccess extends CustomersProfileInfoState {
  final List<CustomerEntity> customerEntity;

  CustomersProfileInfoSuccess({required this.customerEntity});
}

final class CustomersProfileInfoLoading extends CustomersProfileInfoState {}

final class CustomersProfileInfoFailure extends CustomersProfileInfoState {
  final String errorMassage;

  CustomersProfileInfoFailure({required this.errorMassage});
}
