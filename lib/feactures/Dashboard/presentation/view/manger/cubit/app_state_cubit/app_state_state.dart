part of 'app_state_cubit.dart';

@immutable
sealed class AppStatsState {}

final class AppStateInitial extends AppStatsState {}

final class AppStatsSuccess extends AppStatsState {
  final AppStatsEntity stats;

  AppStatsSuccess({required this.stats});
}

final class AppStateLoading extends AppStatsState {}

final class AppStateFailure extends AppStatsState {
  final String errorMessage;

  AppStateFailure({required this.errorMessage});
}
