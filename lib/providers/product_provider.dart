import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductProvider extends ChangeNotifier {
  final List<Product> _allProducts = [
    Product(
      title: 'Sawit',
      description: 'Didatangkan langsung dari tanah Sumatera',
      imgAsset: 'lib/res/sawit.jpg',
      starRating: '4,2',
      totalReview: '67',
    ),
    Product(
      title: 'Cabai',
      description: 'Cabai rawit yang ditumbuhkan secara organik',
      imgAsset: 'lib/res/cabai.jpg',
      starRating: '5,0',
      totalReview: '537',
    ),
    Product(
      title: 'Tebu',
      description: 'Tebu asli yang belum diolah bagi yang membutuhkan saja',
      imgAsset: 'lib/res/tebu.jpg',
      starRating: '4,6',
      totalReview: '293',
    ),
    Product(
      title: 'Ubi Cilembu',
      description:
          'Ubi khas Cilembu yang dikenal dengan rasa manis dan madunya yang hanya keluar ketika dipanggang dengan suhu tertentu',
      imgAsset: 'lib/res/ubi.jpg',
      starRating: '4,8',
      totalReview: '676',
    ),
  ];

  String _searchQuery = '';

  String get searchQuery => _searchQuery;

  void updateSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  List<Product> get filteredProducts {
    if (_searchQuery.isEmpty) {
      return _allProducts;
    }
    return _allProducts
        .where(
          (product) =>
              product.title.toLowerCase().contains(_searchQuery.toLowerCase()),
        )
        .toList();
  }
}
