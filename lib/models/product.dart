import 'package:flutter/foundation.dart';

// كلاس المنتجات فيه خصائص المنتج
class Product
{
  // id للمنتج
  final String id;
  // اسم المنتج
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite;
  final int count;
  Product
      ({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.price,
    @required this.imageUrl,
    @required this.count,
    this.isFavorite=false,
  });
  // factory Product.fromJson(Map<String,dynamic> jsonData)
  // {
  //   return Product(id: jsonData['id'], title:jsonData['title'], description: jsonData['description'], price: jsonData['price'], imageUrl:jsonData[''] , count: jsonData['discount'],);
  // }
}