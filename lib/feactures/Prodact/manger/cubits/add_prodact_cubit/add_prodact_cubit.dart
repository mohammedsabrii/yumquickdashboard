import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:yumquickdashboard/core/service/uplode_image_srevice.dart';

part 'add_prodact_state.dart';

class AddProdactCubit extends Cubit<AddProdactState> {
  AddProdactCubit() : super(AddProdactInitial());
  final UplodeImageSrevice uplodeImageSrevice = UplodeImageSrevice();
  final SupabaseClient supabase = Supabase.instance.client;
  String? selectedCategoryName;

  void selectCategory(String categoryName) {
    selectedCategoryName = categoryName;
    emit(AddProdactInitial());
  }

  Future<void> addProduct(
    BuildContext context, {
    required String name,
    required String subtitle,
    required XFile? imageFile,
    required double price,
    required double priceAfterDiscount,
  }) async {
    if (name.isEmpty || price <= 0 || imageFile == null) {
      emit(
        AddProdactFailure(
          errorMassage:
              'Please fill all required fields and select at least one category',
        ),
      );
      return;
    }

    if (priceAfterDiscount >= price) {
      emit(
        AddProdactFailure(
          errorMassage: 'Price after discount must be less than original price',
        ),
      );
      return;
    }

    emit(AddProdactLoading());
    try {
      final imageUrl = await uplodeImageSrevice.uploadImageToSupabase(
        imageFile,
      );

      final productResponse =
          await supabase
              .from('products')
              .insert({
                'name': name,
                'subtitle': subtitle,
                'image': imageUrl,
                'price': price,
                'price_after_discount': priceAfterDiscount,
                'categories': selectedCategoryName,
              })
              .select()
              .single();

      emit(AddProdactSuccess());
    } catch (e) {
      emit(AddProdactFailure(errorMassage: e.toString()));
    }
  }
}
