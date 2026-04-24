class User {
  final int? id;
  final String name;
  final String email;
  final String phone;
  final String address;

  User({
    this.id,
    required this.name,
    required this.email,
    required this.phone,
    this.address = '',
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int?,
      name: json['names'] ?? json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      address: json['address'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'names': name,
      'email': email,
      'phone': phone,
      'address': address,
    };
  }
}
