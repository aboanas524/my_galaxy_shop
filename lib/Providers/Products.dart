import 'dart:collection';
import 'package:flutter/material.dart';
import '../models/product.dart';
class Products extends ChangeNotifier {
  List<Product> _items = [
    Product(
      id: 'p1',
      title: 'Ipad pro',
      description: 'ipad',
      price: 289,
      imageUrl: 'images/card1.jpg',
    ),
    Product(
      id: 'p2',
      title: 'headphone',
      description: 'headphone that red Color',
      price: 50,
      imageUrl: 'images/card2.jpg',
    ),
    Product(
      id: 'p3',
      title: 'Asus phone',
      description: 'phone',
      price: 225,
      imageUrl: 'images/card3.jpg',
    ),
    Product(
      id: 'p4',
      title: 'Long shoes',
      description: 'shoes',
      price: 20.0,
      imageUrl: 'images/card9.jpg',
    ),
    Product(
      id: 'p5',
      title: 'Lenovo Laptop',
      description: 'Laptop',
      price: 455,
      imageUrl: 'images/card5.jpg',
    ),
    Product(
      id: 'p6',
      title: 'Women\'s Bag',
      description: 'Bag',
      price: 30,
      imageUrl: 'images/Clothes1.jpg',
    ),
    Product(
      id: 'p7',
      title: 'Professional Camera',
      description: 'Camera',
      price: 105,
      imageUrl: 'images/card7.jpg',
    ),
    Product(
      id: 'p8',
      title: 'Nice shoes',
      description: 'shoes',
      price: 15,
      imageUrl: 'images/card13.jpg',
    ),
  ];
  UnmodifiableListView<Product> get items{
    return UnmodifiableListView(_items);
  }
  void addProduct(var value)
  {
    _items.add(value);
    notifyListeners();
  }
}