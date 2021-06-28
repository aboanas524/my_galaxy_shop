import 'package:flutter/cupertino.dart';
import 'package:galaxy_shop_1/models/product.dart';

class CartProvider extends ChangeNotifier {
  List<Product> _cartContent = [];
  List<Product> get cartContent {
    return _cartContent;
  }

  void addToCart(Product product) {
    _cartContent.add(product);
    notifyListeners();
  }

  void removeFromCart(Product product) {
    _cartContent.remove(product);
    notifyListeners();
  }
}
