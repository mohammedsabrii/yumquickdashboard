import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:yumquickdashboard/core/service/app_state_service.dart';
import 'package:yumquickdashboard/feactures/Dashboard/entity/app_state_entity.dart';

part 'app_state_state.dart';

class AppStatsCubit extends Cubit<AppStatsState> {
  AppStatsCubit() : super(AppStateInitial());
  final AppStatsService appStatsService = AppStatsService();
  Future<void> fetchAppState() async {
    emit(AppStateLoading());
    try {
      final state = await appStatsService.getLatestStats();
      emit(AppStatsSuccess(stats: state!));
    } catch (e) {
      emit(AppStateFailure(errorMessage: e.toString()));
    }
  }
}
