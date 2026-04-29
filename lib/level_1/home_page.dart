import 'package:flutter/material.dart';
import 'package:workshop_1/level_1/product_details.dart';
import 'package:workshop_1/level_1/banner_carousel.dart';
import 'package:workshop_1/level_1/fav_button.dart';

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
                                CategoryCard(
                                  title: "Fruits",
                                  imgAsset: 'lib/res/fruits.jpg',
                                ),
                                CategoryCard(
                                  title: "Grains",
                                  imgAsset: 'lib/res/grains.jpg',
                                ),
                                CategoryCard(
                                  title: "Herbs",
                                  imgAsset: 'lib/res/herbs.jpg',
                                ),
                                CategoryCard(
                                  title: "Roots",
                                  imgAsset: 'lib/res/ubi.jpg',
                                ),
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
                        ProductCard(
                          title: 'Sawit',
                          description:
                              'Didatangkan langsung dari tanah Sumatera',
                          imgAsset: 'lib/res/sawit.jpg',
                          starRating: '4,2',
                          totalReview: '67',
                        ),
                        ProductCard(
                          title: 'Cabai',
                          description:
                              'Cabai rawit yang ditumbuhkan secara organik',
                          imgAsset: 'lib/res/cabai.jpg',
                          starRating: '5,0',
                          totalReview: '537',
                        ),
                      ],
                    ),
                    Row(
                      spacing: 20,
                      children: [
                        ProductCard(
                          title: 'Tebu',
                          description:
                              'Tebu asli yang belum diolah bagi yang membutuhkan saja',
                          imgAsset: 'lib/res/tebu.jpg',
                          starRating: '4,6',
                          totalReview: '293',
                        ),
                        ProductCard(
                          title: 'Ubi Cilembu',
                          description:
                              'Ubi khas Cilembu yang dikenal dengan rasa manis dan madunya yang hanya keluar ketika dipanggang dengan suhu tertentu',
                          imgAsset: 'lib/res/ubi.jpg',
                          starRating: '4,8',
                          totalReview: '676',
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
  final String starRating;
  final String totalReview;
  final String imgAsset;
  const ProductCard({
    super.key,
    required this.title,
    required this.description,
    required this.starRating,
    required this.imgAsset,
    required this.totalReview,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetails(
                        title: title,
                        description: description,
                        imgAsset: imgAsset,
                      ),
                    ),
                  );
                },
                child: Container(
                  width: 165,
                  height: 165,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(imgAsset),
                      fit: BoxFit.cover,
                    ),
                    color: Color(0xffd9d9d9),
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              const Positioned(
                top: 12,
                right: 12,
                child: FavButton(),
              ),
            ],
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
              ],
            ),
          ),
          Row(
            children: [
              Icon(Icons.star, color: Color(0xffffdb58)),
              Text(starRating, style: TextStyle(fontWeight: .w900)),
              SizedBox(width: 5),
              Text(
                "($totalReview)",
                style: TextStyle(color: Color(0xff939393), fontWeight: .w700),
              ),
            ],
          ),
          Text(
            description,
            maxLines: 2,
            softWrap: false,
            overflow: TextOverflow.ellipsis,
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
  final String imgAsset;
  const CategoryCard({super.key, required this.title, required this.imgAsset});

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
          CircleAvatar(
            foregroundImage: AssetImage(imgAsset),
            backgroundColor: Color(0xFFc4c4c4),
            radius: 25,
          ),
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
        fillColor: Color(0xffffffff),
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xffededed), width: 0.5),
          borderRadius: .circular(30),
        ),
      ),
    );
  }
}
