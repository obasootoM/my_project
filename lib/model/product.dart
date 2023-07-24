import 'dart:convert';


class Product {
  final String name;
  final String description;
  final double quantity;
  final List<String> images;
  final String category;
  final double price;
  final String id;
  Product(
      {required this.name,
      required this.description,
      required this.quantity,
      required this.category,
      required this.price,
      required this.id,
      required this.images});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'quantity': quantity,
      'category': category,
      'price': price,
      'id': id,
      'images': images
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      name: map['name'] ?? '',
      description: map['description'] as String,
      quantity: map['quantity']?.toDouble() ?? 0.0,
      category: map['category'] as String,
      price: map['price']?.toDouble() ?? 0.0,
      id: map['_id'], 
      images: List<String>.from(map['images']) ,
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source));
}
