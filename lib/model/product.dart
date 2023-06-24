import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';


class Product {
  String name;
  String description;
  double price;
  double quantity;
  String category;
  List<File> images;
  String? id;
  String? userId;

  Product({
    required this.name,
    required this.description,
    required this.price,
    required this.quantity,
    required this.category,
    required this.images,
    this.id,
    this.userId
});

 Map<String, dynamic> toMap() {
   return {
     'name':name,
     'description': description,
     'price': price,
     'quantity': quantity,
     'category': category,
     'images': images,
     'id': id,
     'userId': userId
   };
 }
factory Product.fromMap(Map<String, dynamic>map) {
   return Product(
       name: map['name'] ?? '',
       description: map['description'] ?? '',
       price: map['price'] ?? 0.0,
       quantity: map['quantity'] ?? 0.0,
       category: map['category'] ?? '',
       images: map['images'] ?? '',
       id: map['_id'] ?? '',
       userId: map['userId'] ?? ''
   );}

  String toJson() => json.encode(toMap());
  factory Product.fromJson(String source) => Product.fromJson(json.decode(source));
}