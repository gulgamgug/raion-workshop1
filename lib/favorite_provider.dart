import 'package:flutter/material.dart';

class FavoriteProvider extends ChangeNotifier {
  final List<String> _favoriteProducts = [];

  List<String> get favoriteProducts => _favoriteProducts;

  void toggleFavorite(String productTitle) {
    if (_favoriteProducts.contains(productTitle)) {
      _favoriteProducts.remove(productTitle);
    } else {
      _favoriteProducts.add(productTitle);
    }
    notifyListeners();
  }

  bool isFavorite(String productTitle) {
    return _favoriteProducts.contains(productTitle);
  }
}
