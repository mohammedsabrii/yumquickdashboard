part of 'edit_offer_cubit.dart';

@immutable
sealed class EditOfferState {}

final class EditOfferInitial extends EditOfferState {}

final class EditOfferSuccess extends EditOfferState {}

final class EditOfferLoading extends EditOfferState {}

final class EditOfferFailure extends EditOfferState {
  final String errorMessage;

  EditOfferFailure({required this.errorMessage});
}
