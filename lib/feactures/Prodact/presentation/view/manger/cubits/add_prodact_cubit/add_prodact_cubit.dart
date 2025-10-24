import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:yumquickdashboard/core/service/uplode_image_srevice.dart';

part 'add_prodact_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit() : super(AddProductInitial());

  final UplodeImageSrevice uplodeImageSrevice = UplodeImageSrevice();
  final SupabaseClient supabase = Supabase.instance.client;

  String? selectedCategoryId;
  String? selectedCategoryName;

  void selectCategory(String? categoryId, String? categoryName) {
    selectedCategoryId = categoryId;
    selectedCategoryName = categoryName;
    emit(AddProductInitial());
  }

  Future<void> addProduct(
    BuildContext context, {
    required String name,
    required String subtitle,
    required XFile? imageFile,
    required double price,
    required double priceAfterDiscount,
  }) async {
    if (name.isEmpty ||
        price <= 0 ||
        imageFile == null ||
        selectedCategoryId == null) {
      emit(
        AddProductFailure(
          errorMessage: 'Please fill all required fields and select a category',
        ),
      );
      return;
    }

    if (priceAfterDiscount >= price) {
      emit(
        AddProductFailure(
          errorMessage: 'Price after discount must be less than original price',
        ),
      );
      return;
    }

    emit(AddProductLoading());
    try {
      final imageUrl = await uplodeImageSrevice.uploadImageToSupabase(
        imageFile,
        'products',
      );

      await supabase.from('products').insert({
        'name': name,
        'subtitle': subtitle,
        'image': imageUrl,
        'price': price,
        'price_after_discount': priceAfterDiscount,
        'categories': selectedCategoryName,
        'category_id': selectedCategoryId,
      });

      await supabase.functions.invoke(
        'yumquick_notifications',
        body: {
          'user_id': 'all',
          'title': 'New product!',
          'body': 'New product "$name" has been added to our store, try it now',
        },
      );

      emit(AddProductSuccess());
    } catch (e) {
      emit(AddProductFailure(errorMessage: e.toString()));
    }
  }
}
