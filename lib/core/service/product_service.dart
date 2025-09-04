import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:yumquickdashboard/feactures/Prodact/model/prodact_table_model.dart';

class ProductService {
  final supabase = Supabase.instance.client;

  Future<List<ProductEntity>> fetchProducts() async {
    final response = await supabase
        .from('products')
        .select(
          'name, image, categories, price, price_after_discount, subtitle ,id',
        );

    final products =
        (response as List).map((item) => ProductEntity.fromJson(item)).toList();

    return products;
  }
}
