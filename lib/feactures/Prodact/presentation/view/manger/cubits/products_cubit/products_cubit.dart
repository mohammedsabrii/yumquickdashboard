import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:yumquickdashboard/core/service/product_service.dart';
import 'package:yumquickdashboard/feactures/Prodact/entity/prodact_entity.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsInitial());
  final productService = ProductService();

  void loadProducts() async {
    emit(ProductsLoading());
    try {
      final products = await productService.fetchProducts();
      emit(ProductsSuccess(products));
    } catch (e) {
      emit(ProductsFailure(errorMessage: e.toString()));
    }
  }
}
