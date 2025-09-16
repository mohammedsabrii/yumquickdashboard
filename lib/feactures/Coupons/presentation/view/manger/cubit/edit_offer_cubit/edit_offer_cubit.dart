import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:yumquickdashboard/core/service/uplode_image_srevice.dart';

part 'edit_offer_state.dart';

class EditOfferCubit extends Cubit<EditOfferState> {
  EditOfferCubit() : super(EditOfferInitial());
  final UplodeImageSrevice uplodeImageSrevice = UplodeImageSrevice();
  Future<void> editOffer({
    required String productName,
    required String offerTitle,
    required String subtitle,
    XFile? image,
    required String price,
    required String priceAfterDiscount,
    required String id,
  }) async {
    emit(EditOfferLoading());
    try {
      final SupabaseClient supabase = Supabase.instance.client;
      String? imageUrl;

      if (image != null) {
        final uploadService = UplodeImageSrevice();
        imageUrl = await uploadService.uploadImageToSupabase(image, 'offerss');
      }

      final updateData = {
        'product_name': productName,
        'offer_name': offerTitle,
        'subtitle': subtitle,
        'price': price,
        'price_after_discount': priceAfterDiscount,
      };

      if (imageUrl != null) {
        updateData['image'] = imageUrl;
      }

      await supabase.from('offers').update(updateData).eq('id', id);

      emit(EditOfferSuccess());
    } catch (e) {
      emit(EditOfferFailure(errorMessage: e.toString()));
    }
  }
}
