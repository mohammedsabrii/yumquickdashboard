import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:yumquickdashboard/core/service/customers_service.dart';
import 'package:yumquickdashboard/core/widget/custom_show_snackbar.dart';
import 'package:yumquickdashboard/feactures/Customers/presentation/entity/customer_entity.dart';

part 'customers_profile_info_state.dart';

class CustomersProfileInfoCubit extends Cubit<CustomersProfileInfoState> {
  CustomersProfileInfoCubit() : super(CustomersProfileInfoInitial());
  final customersService = CustomersService();

  Future<void> fetchCustomersInfo(BuildContext context) async {
    emit(CustomersProfileInfoLoading());
    try {
      final customers = await customersService.fetchCustomersDate();
      emit(CustomersProfileInfoSuccess(customerEntity: customers));
    } on AuthApiException catch (e) {
      emit(CustomersProfileInfoFailure(errorMassage: e.toString()));
      customShowSnackBar(context, title: e.toString());
    }
  }

  Future<void> fetchCustomerById(
    BuildContext context,
    String customerId,
  ) async {
    emit(CustomersProfileInfoLoading());
    try {
      final customer = await customersService.fetchCustomerById(customerId);
      emit(CustomersProfileInfoSuccess(customerEntity: [customer]));
    } on AuthApiException catch (e) {
      emit(CustomersProfileInfoFailure(errorMassage: e.toString()));
      customShowSnackBar(context, title: e.toString());
    }
  }
}
