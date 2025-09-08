import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:yumquickdashboard/core/service/uplode_image_srevice.dart';

part 'edit_product_state.dart';

class EditProductCubit extends Cubit<EditProductState> {
  EditProductCubit() : super(EditProductInitial());
  String? selectedCategoryName;
  final UplodeImageSrevice uplodeImageSrevice = UplodeImageSrevice();
  void selectCategory(String categoryName) {
    selectedCategoryName = categoryName;
    emit(EditProductInitial());
  }

  Future<void> editProduct({
    required String name,
    required String subtitle,
    XFile? image,
    required String price,
    required String priceAfterDiscount,
    required String id,
  }) async {
    emit(EditProductLoading());
    try {
      final SupabaseClient supabase = Supabase.instance.client;
      String? imageUrl;

      if (image != null) {
        final uploadService = UplodeImageSrevice();
        imageUrl = await uploadService.uploadImageToSupabase(image);
      }

      final updateData = {
        'name': name,
        'subtitle': subtitle,
        'price': price,
        'price_after_discount': priceAfterDiscount,
      };

      if (imageUrl != null) {
        updateData['image'] = imageUrl;
      }

      await supabase.from('products').update(updateData).eq('id', id);

      emit(EditProductSuccess());
    } catch (e) {
      emit(EditProductFailure(errorMassage: e.toString()));
    }
  }
}
