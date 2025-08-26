part of 'add_prodact_cubit.dart';

@immutable
sealed class AddProdactState {}

final class AddProdactInitial extends AddProdactState {}

final class AddProdactSuccess extends AddProdactState {}

final class AddProdactLoading extends AddProdactState {}

final class AddProdactFailure extends AddProdactState {
  final String errorMassage;

  AddProdactFailure({required this.errorMassage});
}
