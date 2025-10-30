import 'package:intl/intl.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:yumquickdashboard/feactures/orders/entity/active_orders_entity.dart';

class GetCompletedOrdersService {
  final supabase = Supabase.instance.client;

  Future<AppStatsEntity> getOrderStatistics() async {
    final response = await supabase
        .from('completed')
        .select('quantity, total_amount, created_at')
        .order('created_at', ascending: false);

    final List<Map<String, dynamic>> data = List<Map<String, dynamic>>.from(
      response,
    );

    if (data.isEmpty) {
      return _emptyStats();
    }

    final now = DateTime.now().toUtc();
    final last7DaysStart = now.subtract(const Duration(days: 7));
    final last24HoursStart = now.subtract(const Duration(hours: 24));

    int itemsLast7Days = 0;
    int itemsLast24Hours = 0;
    double revenueLast7Days = 0.0;
    double revenueLast24Hours = 0.0;
    double totalRevenue = 0.0;

    final Map<String, int> dailySalesMap = {};
    final Map<String, int> hourlySalesMap = {};

    for (var row in data) {
      final orderDate = DateTime.parse(row['created_at']).toUtc();
      final quantity = row['quantity'] as int;
      final amount = (row['total_amount'] as num).toDouble();

      totalRevenue += amount;

      if (orderDate.isAfter(last7DaysStart)) {
        itemsLast7Days += quantity;
        revenueLast7Days += amount;

        final dayKey = DateFormat('yyyy-MM-dd').format(orderDate);
        dailySalesMap[dayKey] = (dailySalesMap[dayKey] ?? 0) + quantity;

        if (orderDate.isAfter(last24HoursStart)) {
          itemsLast24Hours += quantity;
          revenueLast24Hours += amount;

          final hourKey = DateFormat('HH:00').format(orderDate);
          hourlySalesMap[hourKey] = (hourlySalesMap[hourKey] ?? 0) + quantity;
        }
      }
    }

    final List<DailySales> dailySalesList = _buildDailySales(
      now,
      dailySalesMap,
    );
    final List<HourlySales> hourlySalesList = _buildHourlySales(
      now,
      hourlySalesMap,
    );

    final totalOrders = data.length;
    final itemsSoldPerHour = itemsLast7Days / (7 * 24);
    final itemsSoldPerDayLast7Days = itemsLast7Days / 7.0;
    int totalItemsSold = 0;
    for (var row in data) {
      final quantity = row['quantity'] as int;
      totalItemsSold += quantity;
    }

    return AppStatsEntity(
      totalItemsSold: totalItemsSold,
      itemsSoldLast7Days: itemsLast7Days,
      itemsSoldLast24Hours: itemsLast24Hours,
      itemsSoldPerHour: double.parse(itemsSoldPerHour.toStringAsFixed(2)),
      itemsSoldPerDayLast7Days: double.parse(
        itemsSoldPerDayLast7Days.toStringAsFixed(2),
      ),
      revenueLast7Days: double.parse(revenueLast7Days.toStringAsFixed(2)),
      revenueLast24Hours: double.parse(revenueLast24Hours.toStringAsFixed(2)),
      totalRevenue: double.parse(totalRevenue.toStringAsFixed(2)),
      totalOrders: totalOrders,
      itemsSoldPerDayLast7DaysList: dailySalesList,
      itemsSoldPerHourList: hourlySalesList,
    );
  }

  AppStatsEntity _emptyStats() {
    return AppStatsEntity(
      totalItemsSold: 0,
      itemsSoldLast7Days: 0,
      itemsSoldLast24Hours: 0,
      itemsSoldPerHour: 0.0,
      itemsSoldPerDayLast7Days: 0.0,
      revenueLast7Days: 0.0,
      revenueLast24Hours: 0.0,
      totalRevenue: 0.0,
      totalOrders: 0,
      itemsSoldPerDayLast7DaysList: List.generate(
        7,
        (_) => DailySales(day: '', itemsSold: 0),
      ),
      itemsSoldPerHourList: List.generate(
        24,
        (_) => HourlySales(hour: '', itemsSold: 0),
      ),
    );
  }

  List<DailySales> _buildDailySales(DateTime now, Map<String, int> map) {
    return List.generate(7, (i) {
      final date = now.subtract(Duration(days: 6 - i));
      final dayKey = DateFormat('yyyy-MM-dd').format(date);
      return DailySales(day: dayKey, itemsSold: map[dayKey] ?? 0);
    });
  }

  List<HourlySales> _buildHourlySales(DateTime now, Map<String, int> map) {
    return List.generate(24, (i) {
      final hourTime = now.subtract(Duration(hours: 23 - i));
      final hourKey = DateFormat('HH:00').format(hourTime);
      return HourlySales(hour: hourKey, itemsSold: map[hourKey] ?? 0);
    });
  }

  Future<List<OrdersEntity>> getCompletedOrders() async {
    final response = await supabase
        .from('completed')
        .select('''
      id,
      user_id,               
      quantity,
      total_amount,
      customer_name,
      customer_address,
      created_at,
      products (
        id,
        category_id,
        name,
        subtitle,
        image,
        price,
        categories,
        price_after_discount
      )
    ''')
        .order('created_at', ascending: false);

    return (response as List)
        .map((json) => OrdersEntity.fromJson(json))
        .toList();
  }
}

class DailySales {
  final String day;
  final int itemsSold;

  DailySales({required this.day, required this.itemsSold});
}

class HourlySales {
  final String hour;
  final int itemsSold;

  HourlySales({required this.hour, required this.itemsSold});
}

class AppStatsEntity {
  final int totalItemsSold;
  final int itemsSoldLast7Days;
  final int itemsSoldLast24Hours;
  final double itemsSoldPerHour;
  final double itemsSoldPerDayLast7Days;
  final double revenueLast7Days;
  final double revenueLast24Hours;
  final double totalRevenue;
  final int totalOrders;
  final List<DailySales> itemsSoldPerDayLast7DaysList;
  final List<HourlySales> itemsSoldPerHourList;

  AppStatsEntity({
    required this.totalItemsSold,
    required this.itemsSoldLast7Days,
    required this.itemsSoldLast24Hours,
    required this.itemsSoldPerHour,
    required this.itemsSoldPerDayLast7Days,
    required this.revenueLast7Days,
    required this.revenueLast24Hours,
    required this.totalRevenue,
    required this.totalOrders,
    required this.itemsSoldPerDayLast7DaysList,
    required this.itemsSoldPerHourList,
  });
}
