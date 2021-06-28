import 'package:flutter/cupertino.dart';
import 'package:galaxy_shop_1/models/product.dart';

class FavProvider extends ChangeNotifier {
  List<Product> _favContent = [];
  List<Product> get favContent {
    return _favContent;
  }

  void addToFav(Product product) {
    _favContent.add(product);
    notifyListeners();
  }

  void removeFromFav(Product product) {
    _favContent.remove(product);
    notifyListeners();
  }
}
