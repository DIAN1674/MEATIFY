import 'package:flutter/material.dart';
import 'detailproduk.dart';

void main() {
  runApp(const FavoriteApp());
}

class FavoriteApp extends StatelessWidget {
  const FavoriteApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const FavoriteScreen(),
    );
  }
}

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> favorites = const [
    {
      "image": "images/dagingtenderloin.png",
      "name": "Daging Tenderloin",
      "details": "1Kg, Toko Sapi Maju",
      "price": "Rp. 63.000",
    },
    {
      "image": "images/dagingsirloin.png",
      "name": "Daging Sirloin",
      "details": "1Kg, Toko Sapi Bersih",
      "price": "Rp. 70.000",
    },
    {
      "image": "images/dagingsengkel.png",
      "name": "Daging Sengkel",
      "details": "1Kg, Toko Daging Segar",
      "price": "Rp. 65.000",
    },
    {
      "image": "images/igasapi.png",
      "name": "Iga Sapi",
      "details": "2Kg, Toko Premium Meat",
      "price": "Rp. 120.000",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Favorit",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView.separated(
        itemCount: favorites.length,
        separatorBuilder: (context, index) => const Divider(
          height: 1,
          color: Colors.grey,
        ),
        itemBuilder: (context, index) {
          final item = favorites[index];
          return ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                item["image"],
                width: 60,
                height: 60,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => const Icon(
                  Icons.broken_image,
                  size: 60,
                ),
              ),
            ),
            title: Text(
              item["name"],
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            subtitle: Text(
              item["details"],
              style: const TextStyle(color: Colors.grey, fontSize: 14),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  item["price"],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                    icon: const Icon(Icons.chevron_right, color: Colors.grey),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetailPage(),
                        ),
                      );
                    }),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.brown,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                minimumSize: const Size(double.infinity, 50),
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: Text('Daging-Daging ditambahkan ke keranjang')),
                );
              },
              child: const Text(
                "Tambah Keranjang",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
