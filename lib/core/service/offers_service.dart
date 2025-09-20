import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:yumquickdashboard/feactures/Offers/entity/offers_entity.dart';

class GetOffersService {
  final supabase = Supabase.instance.client;

  Future<List<OffersEntity>> fetchOffers() async {
    final response = await supabase
        .from('offers')
        .select(
          'product_name, offer_name, subtitle, image, price, price_after_discount, category, id',
        );

    final products =
        (response as List).map((item) => OffersEntity.fromJson(item)).toList();

    return products;
  }
}
