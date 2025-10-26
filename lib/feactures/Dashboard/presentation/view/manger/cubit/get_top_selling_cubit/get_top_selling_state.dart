part of 'get_top_selling_cubit.dart';

@immutable
sealed class GetTopSellingState {}

final class GetTopSellingInitial extends GetTopSellingState {}

final class GetTopSellingSuccess extends GetTopSellingState {
  final List<TopSellingEntity> topSellingProducts;

  GetTopSellingSuccess({required this.topSellingProducts});
}

final class GetTopSellingFailure extends GetTopSellingState {
  final String errorMessage;

  GetTopSellingFailure({required this.errorMessage});
}

final class GetTopSellingLoading extends GetTopSellingState {}

final class GetTopSellingEmpty extends GetTopSellingState {}
