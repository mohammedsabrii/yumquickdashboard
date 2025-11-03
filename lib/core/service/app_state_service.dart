import 'package:yumquickdashboard/core/service/customers_service.dart';
import 'package:yumquickdashboard/core/service/get_completed_orders_service.dart';
import 'package:yumquickdashboard/feactures/Dashboard/entity/app_state_entity.dart';

class AppUsersStatsService {
  final CustomersService customersService = CustomersService();
  Future<AppUsersStatsEntity?> getLatestStats() async {
    final userStats = await customersService.getAppUsersStats();
    return userStats;
  }
}

class AppStatsService {
  final GetCompletedOrdersService ordersService = GetCompletedOrdersService();

  Future<AppStatsEntity?> getLatestStats() async {
    final stats = await ordersService.getOrderStatistics();
    return stats;
  }
}
