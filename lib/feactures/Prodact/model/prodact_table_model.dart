class ProdactTableModel {
  final String prodactImage;
  final String prodactName;
  final String prodactCategory;
  final String price;
  final String discountPrice;

  ProdactTableModel({
    required this.prodactImage,
    required this.prodactName,
    required this.prodactCategory,
    required this.discountPrice,
    required this.price,
  });

  // 🟢 Factory لتحويل الداتا من Supabase -> Model
  // factory ProdactTableModel.fromJson(Map<String, dynamic> json) {
  //   return ProdactTableModel(
  //     prodactImage: json['image_url'] ?? '', // لازم يكون عندك العمود في DB
  //     prodactName: json['name'] ?? '',
  //     prodactCategory: json['category'] ?? '',
  //     price: '\$${json['price'] ?? 0}',
  //   );
  // }
}
