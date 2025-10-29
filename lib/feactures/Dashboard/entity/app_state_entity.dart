class AppUsersStatsEntity {
  final int newUsersLast14Days;
  final int totalUsers;
  final int totalVisits;

  AppUsersStatsEntity({
    required this.newUsersLast14Days,
    required this.totalUsers,
    required this.totalVisits,
  });

  factory AppUsersStatsEntity.fromJson(Map<String, dynamic> json) {
    return AppUsersStatsEntity(
      newUsersLast14Days: json['new_users_last_14_days'] ?? 0,
      totalUsers: json['total_users'] ?? 0,
      totalVisits: json['total_visits'] ?? 0,
    );
  }
}
