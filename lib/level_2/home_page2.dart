import 'package:flutter/material.dart';

class HomePage2 extends StatelessWidget {
  const HomePage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          'Farmers',
          style: TextStyle(fontWeight: .w700, fontSize: 24),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: .start,
            spacing: 24,
            children: [
              Container(
                width: .infinity,
                height: 160,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: .circular(10),
                ),
              ),

              Text(
                'Browse Products',
                style: TextStyle(fontWeight: .w700, fontSize: 16),
              ),

              Row(
                spacing: 20,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: .start,
                      children: [
                        Container(
                          width: 165,
                          height: 165,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: .circular(10),
                          ),
                        ),
                        Text(
                          'Berries',
                          style: TextStyle(fontWeight: .w700, fontSize: 20),
                        ),
                        Text(
                          'Lorem ipsum dolor sit a met, constectetur',
                          style: TextStyle(
                            fontWeight: .w600,
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: .start,
                      children: [
                        Container(
                          width: 165,
                          height: 165,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: .circular(10),
                          ),
                        ),
                        Text(
                          'Tulsi',
                          style: TextStyle(fontWeight: .w700, fontSize: 20),
                        ),
                        Text(
                          'Lorem ipsum dolor sit a met, constectetur',
                          style: TextStyle(
                            fontWeight: .w600,
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
