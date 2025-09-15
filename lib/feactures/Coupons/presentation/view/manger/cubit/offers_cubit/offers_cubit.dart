import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:yumquickdashboard/core/service/uplode_image_srevice.dart';
part 'offers_state.dart';

class AddOffersCubit extends Cubit<AddOffersState> {
  AddOffersCubit() : super(OffersInitial());
  final UplodeImageSrevice uplodeImageSrevice = UplodeImageSrevice();
  final SupabaseClient supabase = Supabase.instance.client;
  String? selectedCategoryName;
  void selectCategory(String? categoryName) {
    selectedCategoryName = categoryName;
    emit(OffersInitial());
  }

  Future<void> addOffers({
    required String productName,
    required String offerTitle,
    required String subtitle,
    required XFile? imageFile,
    required double price,
    required double priceAfterDiscount,
  }) async {
    if (offerTitle.isEmpty || price <= 0 || imageFile == null) {
      emit(
        AddOffersFailure(
          errorMessage: 'Please fill all required fields and select a category',
        ),
      );
      return;
    }

    if (priceAfterDiscount >= price) {
      emit(
        AddOffersFailure(
          errorMessage: 'Price after discount must be less than original price',
        ),
      );
      return;
    }
    emit(AddOffersLoading());
    try {
      final imageUrl = await uplodeImageSrevice.uploadImageToSupabase(
        imageFile,
        'offers',
      );
      await supabase.from('offers').insert({
        'product_name': productName,
        'offer_name': offerTitle,
        'subtitle': subtitle,
        'image': imageUrl,
        'price': price,
        'price_after_discount': priceAfterDiscount,
        'category': selectedCategoryName,
      });
      emit(AddOffersSuccess());
    } catch (e) {
      emit(AddOffersFailure(errorMessage: e.toString()));
      print(e.toString());
    }
  }
}
