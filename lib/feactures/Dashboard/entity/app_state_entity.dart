class AppStatsEntity {
  final int itemsSoldLast7Days;
  final int itemsSoldLast24Hours;
  final List<HourlySales> itemsSoldPerHour;
  final List<DailySales> itemsSoldPerDayLast7Days;
  final double revenueLast7Days;
  final double revenueLast24Hours;
  final double totalRevenue;
  final int totalOrders;
  final int newUsersLast14Days;
  final int totalUsers;
  final int totalVisits;
  final DateTime createdAt;

  AppStatsEntity({
    required this.itemsSoldLast7Days,
    required this.itemsSoldLast24Hours,
    required this.itemsSoldPerHour,
    required this.itemsSoldPerDayLast7Days,
    required this.revenueLast7Days,
    required this.revenueLast24Hours,
    required this.totalRevenue,
    required this.totalOrders,
    required this.newUsersLast14Days,
    required this.totalUsers,
    required this.totalVisits,
    required this.createdAt,
  });

  factory AppStatsEntity.fromJson(Map<String, dynamic> json) {
    return AppStatsEntity(
      itemsSoldLast7Days: json['items_sold_last_7_days'] ?? 0,
      itemsSoldLast24Hours: json['items_sold_last_24_hours'] ?? 0,
      itemsSoldPerHour:
          (json['items_sold_per_hour'] as List<dynamic>? ?? [])
              .map((e) => HourlySales.fromJson(e))
              .toList(),
      itemsSoldPerDayLast7Days:
          (json['items_sold_per_day_last_7_days'] as List<dynamic>? ?? [])
              .map((e) => DailySales.fromJson(e))
              .toList(),

      revenueLast7Days: (json['revenue_last_7_days'] ?? 0).toDouble(),
      revenueLast24Hours: (json['revenue_last_24_hours'] ?? 0).toDouble(),
      totalRevenue: (json['total_revenue'] ?? 0).toDouble(),
      totalOrders: json['total_orders'] ?? 0,
      newUsersLast14Days: json['new_users_last_14_days'] ?? 0,
      totalUsers: json['total_users'] ?? 0,
      totalVisits: json['total_visits'] ?? 0,
      createdAt: DateTime.parse(json['created_at']),
    );
  }
}

class HourlySales {
  final String hour;
  final int itemsSold;

  HourlySales({required this.hour, required this.itemsSold});

  factory HourlySales.fromJson(Map<String, dynamic> json) {
    return HourlySales(
      hour: json['hour'] ?? '',
      itemsSold: json['items_sold'] ?? 0,
    );
  }
}

class DailySales {
  final String day;
  final int itemsSold;

  DailySales({required this.day, required this.itemsSold});

  factory DailySales.fromJson(Map<String, dynamic> json) {
    return DailySales(
      day: json['day'] ?? '',
      itemsSold: json['items_sold'] ?? 0,
    );
  }
}
