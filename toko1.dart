import 'package:flutter/material.dart';
import 'package:ritmaflow/bisdig/detailtoko.dart';

void main() {
  runApp(tokokatalog());
}

class tokokatalog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TokoCatalogScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class TokoCatalogScreen extends StatelessWidget {
  final List<Map<String, String>> products = [
    {'name': 'Toko Daging Premium', 'image': 'images/toko1.png'},
    {'name': 'Toko Sapi Daging Sepinggan', 'image': 'images/toko2.png'},
    {'name': 'Toko Daging Sapi Halal', 'image': 'images/toko3.png'},
  ];

  final List<Color> softColors = [
    Color(0xFFFFF3E0), // Light Orange
    Color(0xFFE3F2FD), // Light Blue
    Color(0xFFF1F8E9), // Light Green
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Temukan Toko',
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Cari toko',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
          ),
          // Product Grid
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 2 items per row
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => detailtoko(),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: softColors[index % softColors.length],
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Colors.grey.shade300,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Gambar toko
                        Image.asset(
                          product['image']!,
                          height: 80,
                        ),
                        SizedBox(height: 8),
                        // Nama toko
                        Text(
                          product['name']!,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                          textAlign:
                              TextAlign.center, // Agar teks berada di tengah
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
