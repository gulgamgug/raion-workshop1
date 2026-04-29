import 'package:flutter/material.dart';

class BannerCarousel extends StatefulWidget {
  const BannerCarousel({super.key});

  @override
  State<BannerCarousel> createState() => _BannerCarouselState();
}

class _BannerCarouselState extends State<BannerCarousel> {
  // Controller untuk mengontrol dan memantau pergerakan PageView
  final PageController _pageController = PageController();
  
  // Variabel untuk mencatat halaman mana yang sedang dilihat user
  int _currentPage = 0;

  // Daftar path gambar yang ada di folder lib/res/
  final List<String> _banners = [
    'lib/res/banner1.jpg',
    'lib/res/banner2.jpg',
  ];

  @override
  void dispose() {
    // Selalu dispose controller untuk menghindari kebocoran memori
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 1. Bagian Gambar (Carousel)
        SizedBox(
          height: 160,
          width: double.infinity,
          child: PageView.builder(
            controller: _pageController,
            itemCount: _banners.length,
            onPageChanged: (int index) {
              // Update state ketika user menggeser gambar
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(_banners[index]),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),

        // 2. Jarak antara gambar dan indikator
        const SizedBox(height: 10),

        // 3. Bagian Indikator (Dots)
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            _banners.length,
            (index) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                // Berikan warna aktif (hijau) jika index sama dengan halaman saat ini
                color: _currentPage == index 
                    ? const Color(0xFF007E2F) 
                    : Colors.grey.withOpacity(0.4),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
