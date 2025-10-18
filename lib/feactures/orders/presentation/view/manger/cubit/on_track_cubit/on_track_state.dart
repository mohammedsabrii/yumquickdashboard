part of 'on_track_cubit.dart';

@immutable
sealed class OnTrackState {}

final class OnTrackInitial extends OnTrackState {}

final class OnTrackSuccess extends OnTrackState {
  final List<OrderEntity> onTrackOrders;

  OnTrackSuccess({required this.onTrackOrders});
}

final class OnTrackFailure extends OnTrackState {
  final String errorMessage;

  OnTrackFailure({required this.errorMessage});
}

final class OnTrackLoading extends OnTrackState {}

final class OnTrackEmpty extends OnTrackState {}
