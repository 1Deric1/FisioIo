import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class CustomerModel {
  final String name;
  final String phone;
  final String email;
  final String password;
  final String? image;

  CustomerModel({
    required this.name,
    required this.phone,
    required this.email,
    required this.password,
    this.image,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'phone': phone,
      'image': image,
      'email': email,
      'password': password,
    };
  }

  factory CustomerModel.fromMap(Map<String, dynamic> map) {
    return CustomerModel(
      name: map['name'] as String,
      phone: map['phone'] as String,
      image: map['image'] != null ? map['image'] as String : null,
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CustomerModel.fromJson(String source) =>
      CustomerModel.fromMap(json.decode(source) as Map<String, dynamic>);

  CustomerModel copyWith({
    String? name,
    String? phone,
    String? email,
    String? password,
    String? image,
  }) {
    return CustomerModel(
      name: name ?? this.name,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      password: password ?? this.password,
      image: image ?? this.image,
    );
  }
}
