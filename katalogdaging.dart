import 'package:flutter/material.dart';
import 'package:ritmaflow/bisdig/katalogdaging2.dart';

void main() {
  runApp(MeatCatalogApp());
}

class MeatCatalogApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductCatalogScreen(),
    );
  }
}

class ProductCatalogScreen extends StatelessWidget {
  final List<Map<String, String>> products = [
    {'name': 'Daging Sirloin', 'image': 'images/dagingsirloin.png'},
    {'name': 'Daging Tenderloin', 'image': 'images/dagingtenderloin.png'},
    {'name': 'Daging Sengkel', 'image': 'images/dagingsengkel.png'},
    {'name': 'Buntut Sapi', 'image': 'images/buntutsapi.png'},
    {'name': 'Iga Sapi', 'image': 'images/igasapi.png'},
    {'name': 'Tetelan Sapi', 'image': 'images/tetelansapi.png'},
  ];

  final List<Color> softColors = [
    Color(0xFFFFF3E0), // Light Orange
    Color(0xFFE3F2FD), // Light Blue
    Color(0xFFF1F8E9), // Light Green
    Color(0xFFF8BBD0), // Light Pink
    Color(0xFFFFECB3), // Light Yellow
    Color(0xFFD7CCC8), // Light Brown
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Temukan Produk',
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
                hintText: 'Cari daging',
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
                        builder: (context) => TetelanSapiPage(),
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
                        Image.asset(
                          product['image']!,
                          height: 80,
                        ),
                        SizedBox(height: 8),
                        Text(
                          product['name']!,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
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

class CategoryPage extends StatelessWidget {
  final Map<String, String> product;

  CategoryPage({required this.product});

  @override
  Widget build(BuildContext context) {
    final String productName = product['name']!;
    final String productImage = product['image']!;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Kategori: $productName',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              productImage,
              height: 200,
            ),
            SizedBox(height: 20),
            Text(
              'Produk dalam kategori $productName',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Produk lainnya yang berhubungan dengan $productName.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
