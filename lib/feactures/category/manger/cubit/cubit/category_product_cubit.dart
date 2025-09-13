import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:yumquickdashboard/feactures/Prodact/entity/prodact_entity.dart';

part 'category_product_state.dart';

class ProductsByCategoryCubit extends Cubit<ProductsByCategoryState> {
  ProductsByCategoryCubit() : super(ProductsByCategoryInitial());

  final SupabaseClient supabase = Supabase.instance.client;

  Future<void> fetchProductsByCategory(String categoryId) async {
    emit(ProductsByCategoryLoading());
    try {
      final response = await supabase
          .from('products')
          .select(
            'id, name, subtitle, image, price, price_after_discount, category_id',
          )
          .eq('category_id', categoryId);

      final products =
          (response as List)
              .map((item) => ProductEntity.fromJson(item))
              .toList();

      emit(ProductsByCategorySuccess(products));
    } catch (e) {
      emit(ProductsByCategoryFailure(e.toString()));
    }
  }
}
