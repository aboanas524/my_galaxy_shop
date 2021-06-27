import 'dart:collection';
import 'package:flutter/material.dart';
import '../models/product.dart';

// تعبة منتجات هنا قمنا بأضافتها
class Products extends ChangeNotifier {
  List<Product> _items = [
    Product(
      id: 'p1',
      title: 'Ipad pro',
      description: 'ipad',
      price: 289,
      imageUrl: 'images/card1.jpg',
      count: 4,
    ),
    Product(
      id: 'p2',
      title: 'headphone',
      description: 'headphone that red Color',
      price: 50,
      imageUrl: 'images/card2.jpg',
      count: 25,
    ),
    Product(
      id: 'p3',
      title: 'Asus phone',
      description: 'phone',
      price: 225,
      imageUrl: 'images/card3.jpg',
      count: 19,
    ),
    Product(
      id: 'p4',
      title: 'Long shoes',
      description: 'shoes',
      price: 20.0,
      imageUrl: 'images/card9.jpg',
      count: 112,
    ),
    Product(
      id: 'p5',
      title: 'Lenovo Laptop',
      description: 'Laptop',
      price: 455,
      imageUrl: 'images/card5.jpg',
      count: 11,
    ),
    Product(
      id: 'p6',
      title: 'Women\'s Bag',
      description: 'Bag',
      price: 30,
      imageUrl: 'images/Clothes1.jpg',
      count: 56,
    ),
    Product(
      id: 'p7',
      title: 'Professional Camera',
      description: 'Camera',
      price: 105,
      imageUrl: 'images/card7.jpg',
      count: 39,
    ),
    Product(
      id: 'p8',
      title: 'Nice shoes',
      description: 'shoes',
      price: 15,
      imageUrl: 'images/card13.jpg',
      count: 48,
    ),
  ];
  // لأستدعاء المنتجات
  UnmodifiableListView<Product> get items{
    return UnmodifiableListView(_items);
  }
}