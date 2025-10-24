import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:yumquickdashboard/feactures/orders/entity/active_orders_entity.dart';

class GetOrdersService {
  final supabase = Supabase.instance.client;
  Future<List<OrdersEntity>> getActiveOrders() async {
    final response = await supabase
        .from('active_orders')
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

    final orders =
        (response as List).map((json) => OrdersEntity.fromJson(json)).toList();
    return orders;
  }
}
