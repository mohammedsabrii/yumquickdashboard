import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:yumquickdashboard/feactures/orders/entity/active_orders_entity.dart';

class GetOnTrackOrders {
  final supabase = Supabase.instance.client;
  Future<List<OrderEntity>> getOnTrackOrders() async {
    final response = await supabase
        .from('on_track_orders')
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
        (response as List).map((json) => OrderEntity.fromJson(json)).toList();
    return orders;
  }
}
