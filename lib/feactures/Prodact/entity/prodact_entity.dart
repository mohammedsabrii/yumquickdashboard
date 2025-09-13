class ProductEntity {
  final String id;
  final String categoryId;

  final String name;
  final String image;
  final String category;
  final double price;
  final double priceAfterDiscount;
  final String subtitle;

  ProductEntity({
    required this.id,
    required this.categoryId,
    required this.name,
    required this.image,
    required this.category,
    required this.price,
    required this.priceAfterDiscount,
    required this.subtitle,
  });

  factory ProductEntity.fromJson(Map<String, dynamic> json) {
    return ProductEntity(
      id: json['id'] ?? '',
      categoryId: json['category_id'] ?? '',
      name: json['name'] ?? '',
      image: json['image'] ?? '',
      category: json['categories'] ?? '',
      price: (json['price'] ?? 0).toDouble(),
      priceAfterDiscount: (json['price_after_discount'] ?? 0).toDouble(),
      subtitle: json['subtitle'] ?? '',
    );
  }
}
