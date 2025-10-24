import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:yumquickdashboard/feactures/Dashboard/entity/top_selling_entity.dart';

class GetTopSellingProductsService {
  final supabase = Supabase.instance.client;

  Future<List<TopSellingEntity>> getTopSellingProducts() async {
    final response = await supabase
        .from('top_selling_products')
        .select(
          'name, image, categories, price, price_after_discount, id, total_sales',
        )
        .order('total_sales', ascending: false);

    final products =
        (response as List)
            .map((json) => TopSellingEntity.fromJson(json))
            .toList();
    return products;
  }
}
