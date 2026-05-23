import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workshop_1/level_1/product_details.dart';
import 'package:workshop_1/level_1/banner_carousel.dart';
import 'package:workshop_1/level_1/fav_button.dart';
import 'package:workshop_1/providers/product_provider.dart';

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
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: SearchField(), //SEARCH FIELD
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Text(
                              'Categories',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              spacing: 7,
                              children: const [
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
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                    Consumer<ProductProvider>(
                      builder: (context, productProvider, child) {
                        final products = productProvider.filteredProducts;

                        if (products.isEmpty) {
                          return const Center(
                            child: Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Text(
                                "No products found",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          );
                        }

                        List<Widget> productRows = [];
                        for (int i = 0; i < products.length; i += 2) {
                          List<Widget> rowChildren = [];
                          rowChildren.add(
                            ProductCard(
                              title: products[i].title,
                              description: products[i].description,
                              imgAsset: products[i].imgAsset,
                              starRating: products[i].starRating,
                              totalReview: products[i].totalReview,
                            ),
                          );

                          if (i + 1 < products.length) {
                            rowChildren.add(
                              ProductCard(
                                title: products[i + 1].title,
                                description: products[i + 1].description,
                                imgAsset: products[i + 1].imgAsset,
                                starRating: products[i + 1].starRating,
                                totalReview: products[i + 1].totalReview,
                              ),
                            );
                          } else {
                            rowChildren.add(const Expanded(child: SizedBox()));
                          }

                          productRows.add(
                            Row(
                              spacing: 20,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: rowChildren,
                            ),
                          );
                        }

                        return Column(spacing: 20, children: productRows);
                      },
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
                    color: const Color(0xffd9d9d9),
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              Positioned(
                top: 12,
                right: 12,
                child: FavButton(productTitle: title),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    title,
                    maxLines: 1,
                    softWrap: false,
                    overflow: TextOverflow.fade,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
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
              const Icon(Icons.star, color: Color(0xffffdb58)),
              Text(
                starRating,
                style: const TextStyle(fontWeight: FontWeight.w900),
              ),
              const SizedBox(width: 5),
              Text(
                "($totalReview)",
                style: const TextStyle(
                  color: Color(0xff939393),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          Text(
            description,
            maxLines: 2,
            softWrap: false,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
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
      padding: const EdgeInsets.all(4),
      height: 56,
      decoration: BoxDecoration(
        color: const Color(0xffd9d9d9),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        spacing: 8,
        children: [
          CircleAvatar(
            foregroundImage: AssetImage(imgAsset),
            backgroundColor: const Color(0xFFc4c4c4),
            radius: 25,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        context.read<ProductProvider>().updateSearchQuery(value);
      },
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search),
        hintText: "Search...",
        fillColor: const Color(0xffffffff),
        filled: true,
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xffededed), width: 0.5),
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}
