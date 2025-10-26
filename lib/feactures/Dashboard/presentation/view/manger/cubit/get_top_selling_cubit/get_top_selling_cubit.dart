import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:yumquickdashboard/core/service/get_top_selling_products_service.dart';
import 'package:yumquickdashboard/feactures/Dashboard/entity/top_selling_entity.dart';

part 'get_top_selling_state.dart';

class GetTopSellingCubit extends Cubit<GetTopSellingState> {
  GetTopSellingCubit() : super(GetTopSellingInitial());
  final GetTopSellingProductsService getTopSellingProductsService =
      GetTopSellingProductsService();
  Future<void> getTopSelling() async {
    emit(GetTopSellingLoading());
    try {
      final topSellingProducts =
          await getTopSellingProductsService.getTopSellingProducts();
      if (topSellingProducts.isEmpty) {
        emit(GetTopSellingEmpty());
      } else {
        emit(GetTopSellingSuccess(topSellingProducts: topSellingProducts));
      }
    } catch (e) {
      print('🚑🚑🚑🚑🚑🚑🚑🚑🚑🚑🚑 $e 🚑🚑🚑🚑🚑🚑🚑🚑🚑🚑');
      emit(GetTopSellingFailure(errorMessage: e.toString()));
    }
  }
}
