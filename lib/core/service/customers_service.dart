import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:yumquickdashboard/feactures/Customers/presentation/entity/customer_entity.dart';

class CustomersService {
  final supabase = Supabase.instance.client;
  Future<List<CustomerEntity>> fetchCustomersDate() async {
    final response = await supabase
        .from('profiles')
        .select('username, phone, email, country, date_of_birth, address, id');

    final customer =
        (response as List)
            .map((item) => CustomerEntity.fromJson(item))
            .toList();

    return customer;
  }
}
