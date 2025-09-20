part of 'offers_cubit.dart';

@immutable
sealed class AddOffersState {}

final class OffersInitial extends AddOffersState {}

final class AddOffersSuccess extends AddOffersState {}

final class AddOffersFailure extends AddOffersState {
  final String errorMessage;

  AddOffersFailure({required this.errorMessage});
}

final class AddOffersLoading extends AddOffersState {}
