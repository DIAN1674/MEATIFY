import 'package:flutter/material.dart';
import 'favorit.dart';
import 'katalogdaging.dart';
import 'keranjang.dart';
import 'dagingterlaris.dart';
import 'toko1.dart';
import 'detailproduk.dart';
import 'profile.dart';

void main() {
  runApp(MeatifyApp());
}

class MeatifyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomeTab(), // Beranda
    MeatCatalogApp(), // Katalog
    keranjang(), // Keranjang
    FavoriteApp(), //favorit
    meatprofile(), //profil
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'images/metify.png',
              height: 40,
            ),
          ),
        ),
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Katalog'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'Keranjang'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border), label: 'Favorit'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: 'Akun Profil'),
        ],
      ),
    );
  }
}

class HomeTab extends StatefulWidget {
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  Set<int> cartItems = {};

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        TextField(
          decoration: InputDecoration(
            hintText: 'Cari daging...',
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
        SizedBox(height: 16.0),
        Container(
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            image: DecorationImage(
              image: AssetImage('images/banner.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 16.0),
        SectionTitle(
          title: 'Daging Terlaris',
          onViewAll: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DagingTerlarisPage(),
              ),
            );
          },
        ),
        SizedBox(height: 12.0),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(width: 16),
              ProductCard(
                index: 0,
                name: 'Daging Sapi Sirloin',
                price: 'Rp.65.000',
                image: 'images/dagingsirloin.png',
                store: '1 Kg, Toko Premium',
                isInCart: cartItems.contains(0),
                onToggleCart: (index) {
                  setState(() {
                    if (cartItems.contains(index)) {
                      cartItems.remove(index);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                              'Daging Sapi Sirloin dihapus dari keranjang'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    } else {
                      cartItems.add(index);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                              'Daging Sapi Sirloin ditambahkan ke keranjang'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    }
                  });
                },
              ),
              SizedBox(width: 16),
              ProductCard(
                index: 1,
                name: 'Daging Tenderloin',
                price: 'Rp.140.000',
                image: 'images/dagingtenderloin.png',
                store: '1 Kg, Toko Sepinggan',
                isInCart: cartItems.contains(1),
                onToggleCart: (index) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetailPage(),
                    ),
                  );
                },
              ),
              SizedBox(width: 16),
              ProductCard(
                index: 1,
                name: 'Daging Sengkel',
                price: 'Rp.140.000',
                image: 'images/dagingsengkel.png',
                store: '1 Kg, Toko Sepinggan',
                isInCart: cartItems.contains(1),
                onToggleCart: (index) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetailPage(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        SizedBox(height: 16.0),
        SectionTitle(
          title: 'Toko Daging Terpopuler',
          onViewAll: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TokoCatalogScreen(),
              ),
            );
          },
        ),
        SizedBox(height: 12.0),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(width: 16),
              StoreCard(
                name: 'Toko Daging Premium Balikpapan',
                image: 'images/toko1.png',
              ),
              SizedBox(width: 16),
              StoreCard(
                name: 'Toko Daging Sapi Sepinggan',
                image: 'images/toko2.png',
              ),
              SizedBox(width: 16),
              StoreCard(
                name: 'Toko Daging Halal Balikpapan',
                image: 'images/toko3.png',
              ),
              SizedBox(width: 16),
            ],
          ),
        ),
      ],
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  final VoidCallback onViewAll;

  SectionTitle({required this.title, required this.onViewAll});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        TextButton(
          onPressed: onViewAll,
          child: Text('Lihat Semua'),
        ),
      ],
    );
  }
}

class ProductCard extends StatelessWidget {
  final int index;
  final String name;
  final String price;
  final String image;
  final String store;
  final bool isInCart;
  final ValueChanged<int> onToggleCart;

  ProductCard({
    required this.index,
    required this.name,
    required this.price,
    required this.image,
    required this.store,
    required this.isInCart,
    required this.onToggleCart,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailPage(),
                  ),
                );
              },
              child: Image.asset(
                image,
                height: 140,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              price,
              style: TextStyle(
                color: Color(0xFF6A1B1B),
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              store,
              style: TextStyle(
                color: Colors.black54,
                fontSize: 12,
              ),
            ),
          ),
          IconButton(
            onPressed: () => onToggleCart(index),
            icon: Icon(
              Icons.add_circle,
              color: isInCart ? Color(0xFF6A1B1B) : Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}

class StoreCard extends StatelessWidget {
  final String name;
  final String image;

  StoreCard({required this.name, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.asset(
              image,
              height: 140,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
