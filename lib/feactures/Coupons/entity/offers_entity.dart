class OffersEntity {
  final String id, offerName, productName, subtitle, image, category;
  final double price, priceAfterDiscount;
  OffersEntity({
    required this.id,
    required this.offerName,
    required this.productName,
    required this.price,
    required this.priceAfterDiscount,
    required this.subtitle,
    required this.image,
    required this.category,
  });
  factory OffersEntity.fromJson(Map<String, dynamic> json) {
    return OffersEntity(
      id: json['id'] ?? '',
      productName: json['product_name'] ?? '',
      offerName: json['offer_name'] ?? '',
      image: json['image'] ?? '',
      category: json['category'] ?? '',
      price: (json['price'] ?? 0).toDouble(),
      priceAfterDiscount: (json['price_after_discount'] ?? 0).toDouble(),
      subtitle: json['subtitle'] ?? '',
    );
  }
}
