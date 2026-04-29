import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  final String title;
  final String description;

  const ProductDetails({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
      body: Column(
        crossAxisAlignment: .start,
        children: [
          Container(
            width: .infinity,
            height: 319,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
              color: Color(0xFFD9D9D9),
            ),
          ),
          Expanded(
            //AKU PENGEN INI MULAINYA DARI SISI KIRI LAYAR DENGAN PADDING, BUKAN DARI TENGAH
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 32),
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      title,
                      style: TextStyle(fontSize: 24, fontWeight: .w600),
                    ),
                  ),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: .w600,
                      color: Color(0xFF505050),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
