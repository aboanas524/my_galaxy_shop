import 'package:flutter/foundation.dart';

// كلاس المنتجات فيه خصائص المنتج
class Product {
  // id للمنتج
  final String id;
  // اسم المنتج
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  int count;
  Product({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.price,
    @required this.imageUrl,
    this.count = 0,
  });
  static Product fromMap(Map map) {
    return Product(
      id: map['id'].toString(),
      title: map['title'],
      description: map['description'],
      price: double.parse(map['price']),
      imageUrl: map['image'] ?? 'https://via.placeholder.com/150',
    );
  }
}
