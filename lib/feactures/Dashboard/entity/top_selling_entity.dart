class TopSellingEntity {
  final String id;
  final String name;
  final String image;
  final String category;
  final double price;
  final double? priceAfterDiscount;
  final num totalSales;

  TopSellingEntity({
    required this.id,
    required this.name,
    required this.image,
    required this.category,
    required this.price,
    required this.priceAfterDiscount,
    required this.totalSales,
  });
  factory TopSellingEntity.fromJson(Map<String, dynamic> json) {
    return TopSellingEntity(
      totalSales: json['total_sales'] ?? 0,
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      image: json['image'] ?? '',
      category: json['categories'] ?? '',
      price: (json['price'] ?? 0).toDouble(),
      priceAfterDiscount:
          json['price_after_discount'] != null
              ? (json['price_after_discount'] as num).toDouble()
              : null,
    );
  }
}
