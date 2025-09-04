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
    if (name.isEmpty ||
        price <= 0 ||
        selectedCategoryName == null ||
        imageFile == null) {
      emit(
        AddProdactFailure(
          errorMassage: 'يرجى ملء جميع الحقول المطلوبة واختيار فئة',
        ),
      );
      return;
    }

    if (priceAfterDiscount >= price) {
      emit(
        AddProdactFailure(
          errorMassage: 'يجب أن يكون السعر بعد الخصم أقل من السعر الأصلي',
        ),
      );
      return;
    }

    emit(AddProdactLoading());
    try {
      final imageUrl = await uplodeImageSrevice.uploadImageToSupabase(
        imageFile,
      );
      final supabase = Supabase.instance.client;

      final productResponse =
          await supabase
              .from('products')
              .insert({
                'name': name,
                'subtitle': subtitle,
                'image': imageUrl,
                'category':
                    selectedCategoryName, // تغيير من 'categories' إلى 'category'
                'price': price,
                'price_after_discount': priceAfterDiscount,
                // يمكن إضافة 'discount_rate' إذا كنت تحتاجه
              })
              .select()
              .single();

      emit(AddProdactSuccess());
    } catch (e) {
      emit(AddProdactFailure(errorMassage: e.toString()));
      print(e.toString());
    }
  }
}
