import 'package:yumquickdashboard/feactures/Prodact/entity/prodact_entity.dart';

class OrderEntity {
  final String? id;
  final String userId;
  final ProductEntity product;
  final int quantity;
  final double totalAmount;
  final String customerName;
  final String customerAddress;
  final DateTime createdAt;
  OrderEntity({
    this.id,
    required this.userId,
    required this.product,
    required this.quantity,
    required this.totalAmount,
    required this.customerName,
    required this.customerAddress,
    required this.createdAt,
  });

  factory OrderEntity.fromJson(Map<String, dynamic> json) {
    return OrderEntity(
      id: json['id'],
      userId: json['user_id'] ?? '',
      product: ProductEntity.fromJson(json['products']),
      quantity: json['quantity'] ?? 1,
      totalAmount: (json['total_amount'] as num?)?.toDouble() ?? 0.0,
      customerAddress: json['customer_address'] ?? '',
      customerName: json['customer_name'] ?? '',
      createdAt: DateTime.parse(json['created_at']),
    );
  }
}
