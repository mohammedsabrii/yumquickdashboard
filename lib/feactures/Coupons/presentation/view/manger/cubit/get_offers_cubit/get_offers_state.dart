part of 'get_offers_cubit.dart';

@immutable
sealed class GetOffersState {}

final class GetOffersInitial extends GetOffersState {}

final class GetOffersSuccess extends GetOffersState {
  final List<OffersEntity> getOffers;

  GetOffersSuccess({required this.getOffers});
}

final class GetOffersFailure extends GetOffersState {
  final String errorMessage;

  GetOffersFailure({required this.errorMessage});
}

final class GetOffersLoading extends GetOffersState {}
