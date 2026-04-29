import 'package:flutter/material.dart';
import 'package:workshop_1/level_1/product_details.dart';
import 'package:workshop_1/level_1/banner_carousel.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          'Explore',
          style: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 24,
            color: Color(0xFF007e2f),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: SearchField(),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 24,
                  children: [
                    const BannerCarousel(),

                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Column(
                        crossAxisAlignment: .start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: const Text(
                              'Categories',
                              style: TextStyle(fontWeight: .w700, fontSize: 16),
                            ),
                          ),
                          SingleChildScrollView(
                            scrollDirection: .horizontal,
                            child: Row(
                              spacing: 7,
                              children: [
                                CategoryCard(title: "Fruits"),
                                CategoryCard(title: "Grains"),
                                CategoryCard(title: "Herbs"),
                                CategoryCard(title: "Herbs"),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Text(
                      "Browse Products",
                      style: TextStyle(fontWeight: .w700, fontSize: 16),
                    ),
                    Row(
                      spacing: 20,
                      children: [
                        ProductCard(title: 'TUlsi', description: 'Huauwahhaa'),
                        ProductCard(
                          title: 'Mawar',
                          description: 'Mawar dari Belanda',
                        ),
                      ],
                    ),
                    Row(
                      spacing: 20,
                      children: [
                        ProductCard(
                          title: 'Durian Belanda',
                          description: 'Sirsak',
                        ),
                        ProductCard(
                          title: 'Sirsak',
                          description: 'Durian Belanda',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String title;
  final String description;
  const ProductCard({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ProductDetails(title: title, description: description),
                ),
              );
            },
            child: Container(
              width: 165,
              height: 165,
              decoration: BoxDecoration(
                color: Color(0xffd9d9d9),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 5),
            child: Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    title,
                    maxLines: 1,
                    softWrap: false,
                    overflow: TextOverflow.fade,
                    style: TextStyle(
                      fontWeight: .w700,
                      fontSize: 20,
                      color: Color(0xff505050),
                    ),
                  ),
                ),
                Icon(Icons.favorite_border),
              ],
            ),
          ),
          Text(
            description,
            style: TextStyle(
              fontWeight: .w600,
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String title;
  const CategoryCard({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: .all(4),
      height: 56,
      decoration: BoxDecoration(
        color: Color(0xffd9d9d9),
        borderRadius: .circular(50),
      ),
      child: Row(
        spacing: 8,
        children: [
          CircleAvatar(backgroundColor: Color(0xFFc4c4c4), radius: 25),
          Padding(
            padding: .only(right: 20),
            child: Text(title, style: TextStyle(fontWeight: .w700)),
          ),
        ],
      ),
    );
  }
}

class SearchField extends StatefulWidget {
  const SearchField({super.key});

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search),
        hintText: "Search...",
        fillColor: Color(0xffd9d9d9),
        filled: true,
        border: OutlineInputBorder(
          borderSide: .none,
          borderRadius: .circular(10),
        ),
      ),
    );
  }
}
