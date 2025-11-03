import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:yumquickdashboard/feactures/Customers/presentation/entity/customer_entity.dart';
import 'package:yumquickdashboard/feactures/Dashboard/entity/app_state_entity.dart';

class CustomersService {
  final supabase = Supabase.instance.client;
  Future<List<CustomerEntity>> fetchCustomersDate() async {
    final response = await supabase
        .from('profiles')
        .select('username, phone, email, country, date_of_birth, address, id');
    return response.map((data) => CustomerEntity.fromJson(data)).toList();
  }

  Future<AppUsersStatsEntity> getAppUsersStats() async {
    final response = await supabase
        .from('profiles')
        .select(
          'username, phone, email, country, date_of_birth, address, id, created_at',
        );

    final customers =
        List<Map<String, dynamic>>.from(
          response,
        ).map((data) => CustomerEntity.fromJson(data)).toList();

    final totalUsers = customers.length;

    final now = DateTime.now();
    final newUsersLast14Days =
        customers.where((user) {
          final createdAt = user.createdAt;
          return createdAt.isAfter(now.subtract(const Duration(days: 14)));
        }).length;

    return AppUsersStatsEntity(
      newUsersLast14Days: newUsersLast14Days,
      totalUsers: totalUsers,
      totalVisits: 0,
    );
  }

  Future<CustomerEntity> fetchCustomerById(String customerId) async {
    final response =
        await supabase
            .from('profiles')
            .select(
              'username, phone, email, country, date_of_birth, address, id',
            )
            .eq('id', customerId)
            .single();

    return CustomerEntity.fromJson(response);
  }
}
