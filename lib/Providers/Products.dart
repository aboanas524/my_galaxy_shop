import 'dart:convert';
import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:galaxy_shop_1/Providers/account.dart';
import '../models/product.dart';
import 'package:http/http.dart' as http;

// تعبة منتجات هنا قمنا بأضافتها
class Products extends ChangeNotifier {
  Future getAllProducts() async {
    if (_items.isNotEmpty) return;
    var headers = {
      'Content-Type': 'application/json',
      'token': storage.getString(TOKEN_KEY),
    };
    var request =
        http.Request('GET', Uri.parse('http://$SERVER_IP/api/v1/product/all'));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    try {
      var body = await response.stream.bytesToString();
      if (body != null) {
        var bodyJson = jsonDecode(body);
        if (bodyJson['recordsTotal'] != null) {
          _items.clear();
          (bodyJson['data'] as List).forEach((element) {
            _items.add(Product.fromMap(element));
          });
          notifyListeners();
        }
      }
    } finally {}
  }

  List<Product> _items = [
    /*
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
    ),*/
  ];
  // لأستدعاء المنتجات
  UnmodifiableListView<Product> get items {
    return UnmodifiableListView(_items);
  }
}
