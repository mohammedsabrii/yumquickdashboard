// class ProdactTableModel {
//   final String prodactImage;
//   final String prodactName;
//   final String prodactCategory;
//   final String price;
//   final String discountPrice;

//   ProdactTableModel({
//     required this.prodactImage,
//     required this.prodactName,
//     required this.prodactCategory,
//     required this.price,
//     required this.discountPrice,
//   });

//   factory ProdactTableModel.fromJson(Map<String, dynamic> json) {
//     return ProdactTableModel(
//       prodactImage: json['image'] ?? '',
//       prodactName: json['name'] ?? '',
//       prodactCategory: json['category'] ?? '',
//       price: '\$${json['price'] ?? 0}',
//       discountPrice: '\$${json['price_after_discount'] ?? 0}',
//     );
//   }
// }
