import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:yumquickdashboard/feactures/Customers/presentation/entity/customer_entity.dart';

class CustomersService {
  final supabase = Supabase.instance.client;
  Future<List<CustomerEntity>> fetchCustomersDate() async {
    final response = await supabase
        .from('profiles')
        .select('username, phone, email, country, date_of_birth, address, id');
    return response.map((data) => CustomerEntity.fromJson(data)).toList();
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
