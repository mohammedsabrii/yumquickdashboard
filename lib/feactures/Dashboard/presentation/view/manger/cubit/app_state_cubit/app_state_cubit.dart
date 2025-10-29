import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:yumquickdashboard/core/service/app_state_service.dart';
import 'package:yumquickdashboard/core/service/get_completed_orders_service.dart';
import 'package:yumquickdashboard/feactures/Dashboard/entity/app_state_entity.dart';

part 'app_state_state.dart';

class AppStatsCubit extends Cubit<AppStatsState> {
  AppStatsCubit() : super(AppStateInitial());

  final AppStatsService appStatsService = AppStatsService();
  final AppUsersStatsService appUsersStatsService = AppUsersStatsService();

  Future<void> fetchAppStats() async {
    emit(AppStateLoading());
    try {
      final stats = await appStatsService.getLatestStats();
      final usersStats = await appUsersStatsService.getLatestStats();

      if (stats == null) {
        emit(AppStateFailure(errorMessage: 'No data available'));
      } else {
        emit(AppStatsSuccess(stats: stats, usersStats: usersStats!));
      }
    } catch (e) {
      emit(AppStateFailure(errorMessage: e.toString()));
    }
  }

  void startAutoRefresh() {
    Future.doWhile(() async {
      await fetchAppStats();
      await Future.delayed(const Duration(minutes: 1));
      return true;
    });
  }
}
