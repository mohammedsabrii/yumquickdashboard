import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'add_prodact_state.dart';

class AddProdactCubit extends Cubit<AddProdactState> {
  AddProdactCubit() : super(AddProdactInitial());

  final SupabaseClient supabase = Supabase.instance.client;
  List<String> selectedCategoryNames = [];

  void toggleCategory(String categoryName, bool isSelected) {
    if (isSelected) {
      selectedCategoryNames.add(categoryName);
    } else {
      selectedCategoryNames.remove(categoryName);
    }
    emit(AddProdactInitial());
  }

  Future<String> uploadImageToSupabase(XFile imageFile) async {
    final fileName =
        '${DateTime.now().millisecondsSinceEpoch}_${imageFile.name}';
    final filePath = 'products/$fileName';
    final bytes = await imageFile.readAsBytes();

    await supabase.storage
        .from('products')
        .uploadBinary(
          filePath,
          bytes,
          fileOptions: const FileOptions(cacheControl: '3600', upsert: false),
        );

    return supabase.storage.from('products').getPublicUrl(filePath);
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
        selectedCategoryNames.isEmpty ||
        imageFile == null) {
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
      final imageUrl = await uploadImageToSupabase(imageFile);

      final productResponse =
          await supabase
              .from('products')
              .insert({
                'name': name,
                'subtitle': subtitle,
                'image': imageUrl,
                'price': price,
                'price_after_discount': priceAfterDiscount,

                'categories': selectedCategoryNames,
              })
              .select()
              .single();
      final selectedCategory =
          await supabase
              .from(selectedCategoryNames[0])
              .insert({
                'name': name,
                'subtitle': subtitle,
                'image': imageUrl,
                'price': price,
                'price_after_discount': priceAfterDiscount,

                'categories': selectedCategoryNames,
              })
              .select()
              .single();

      emit(AddProdactSuccess());
    } catch (e) {
      emit(AddProdactFailure(errorMassage: e.toString()));
    }
  }
}
