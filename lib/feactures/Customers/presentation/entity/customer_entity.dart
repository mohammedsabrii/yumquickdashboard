class CustomerEntity {
  final String name, email, address, phone, country, id;
  final DateTime dateOfBirth;
  final DateTime createdAt;
  CustomerEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.address,
    required this.phone,
    required this.country,
    required this.dateOfBirth,
    required this.createdAt,
  });

  factory CustomerEntity.fromJson(Map<String, dynamic> json) {
    return CustomerEntity(
      id: json['id'] ?? '',
      name: json['username'] ?? '',
      phone: json['phone'] ?? '',
      email: json['email'] ?? '',
      country: json['country'] ?? '',
      address: json['address'] ?? '',
      dateOfBirth:
          json['date_of_birth'] != null && json['date_of_birth'] != ''
              ? DateTime.parse(json['date_of_birth'])
              : DateTime(1900),
      createdAt:
          json['created_at'] != null && json['created_at'] != ''
              ? DateTime.parse(json['created_at'])
              : DateTime(1900),
    );
  }
}
