import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:yumquickdashboard/core/service/get_completed_orders_service.dart';
import 'package:yumquickdashboard/feactures/Dashboard/entity/app_state_entity.dart';

class AppUsersStatsService {
  final supabase = Supabase.instance.client;

  Future<AppUsersStatsEntity?> getLatestStats() async {
    final response =
        await supabase
            .from('app_stats')
            .select()
            .order('updated_at', ascending: false)
            .limit(1)
            .single();

    return AppUsersStatsEntity.fromJson(response);
  }
}

class AppStatsService {
  final GetCompletedOrdersService _ordersService = GetCompletedOrdersService();

  Future<AppStatsEntity?> getLatestStats() async {
    final stats = await _ordersService.getOrderStatistics();
    return stats;
  }
}
