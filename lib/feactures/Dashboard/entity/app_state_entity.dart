class AppUsersStatsEntity {
  final int newUsersLast14Days;
  final int totalUsers;
  final int totalVisits;

  AppUsersStatsEntity({
    required this.newUsersLast14Days,
    required this.totalUsers,
    required this.totalVisits,
  });
}
