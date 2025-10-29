part of 'app_state_cubit.dart';

@immutable
sealed class AppStatsState {}

final class AppStateInitial extends AppStatsState {}

final class AppStatsSuccess extends AppStatsState {
  final AppStatsEntity stats;
  final AppUsersStatsEntity usersStats;

  AppStatsSuccess({required this.stats, required this.usersStats});
}

final class AppStateLoading extends AppStatsState {}

final class AppStateFailure extends AppStatsState {
  final String errorMessage;

  AppStateFailure({required this.errorMessage});
}
