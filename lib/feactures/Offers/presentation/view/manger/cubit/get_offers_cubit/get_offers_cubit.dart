import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:yumquickdashboard/core/service/offers_service.dart';
import 'package:yumquickdashboard/feactures/Offers/entity/offers_entity.dart';

part 'get_offers_state.dart';

class GetOffersCubit extends Cubit<GetOffersState> {
  GetOffersCubit() : super(GetOffersInitial());
  final getOffersService = GetOffersService();

  Future<void> getOffers() async {
    emit(GetOffersLoading());
    try {
      final getOffers = await getOffersService.fetchOffers();
      emit(GetOffersSuccess(getOffers: getOffers));
    } catch (e) {
      emit(GetOffersFailure(errorMessage: e.toString()));
    }
  }
}
