import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TetelanSapiPage(),
    );
  }
}

class TetelanSapiPage extends StatefulWidget {
  @override
  _TetelanSapiPageState createState() => _TetelanSapiPageState();
}

class _TetelanSapiPageState extends State<TetelanSapiPage> {
  // Daftar produk
  final List<Map<String, String>> products = [
    {
      'name': 'Tetelan Sapi Prem',
      'price': 'Rp. 65.000',
      'image': 'images/tetelansapiprem.png',
      'store': 'Toko Premium'
    },
    {
      'name': 'Tetelan Sapi Bersih',
      'price': 'Rp. 63.000',
      'image': 'images/tetelansapiprem.png',
      'store': 'Toko Premium'
    },
    {
      'name': 'Tetelan Sapi Kikil',
      'price': 'Rp. 65.000',
      'image': 'images/tetelansapiprem.png',
      'store': 'Toko Premium'
    },
    {
      'name': 'Tetelan Sapi Wagyu',
      'price': 'Rp. 63.000',
      'image': 'images/tetelansapiprem.png',
      'store': 'Toko Wagyu'
    },
    {
      'name': 'Tetelan Bakso',
      'price': 'Rp. 65.000',
      'image': 'images/tetelansapiprem.png',
      'store': 'Toko Bakso'
    },
    {
      'name': 'Tetelan Daging',
      'price': 'Rp. 63.000',
      'image': 'images/tetelansapiprem.png',
      'store': 'Toko Daging'
    },
  ];

  // Daftar toko yang dapat difilter
  final List<String> stores = [
    'Toko Premium',
    'Toko Wagyu',
    'Toko Bakso',
    'Toko Daging'
  ];

  // Toko yang dipilih untuk filter
  List<String> selectedStores = ['Toko Premium'];

  // Produk yang telah ditambahkan ke keranjang
  Set<int> cartItems = {};

  // Memfilter produk berdasarkan toko yang dipilih
  List<Map<String, String>> get filteredProducts {
    if (selectedStores.isEmpty) return [];
    return products
        .where((product) => selectedStores.contains(product['store']))
        .toList();
  }

  // Menampilkan pop-up notifikasi
  void showNotification(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Tutup'),
            ),
          ],
        );
      },
    );
  }

  // Menampilkan dialog filter toko
  void showFilterDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text('Filter Toko'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: stores.map((store) {
                  return CheckboxListTile(
                    title: Text(store),
                    value: selectedStores.contains(store),
                    onChanged: (bool? value) {
                      setState(() {
                        if (value == true) {
                          selectedStores.add(store);
                        } else {
                          selectedStores.remove(store);
                        }
                      });
                      this.setState(() {});
                    },
                  );
                }).toList(),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Tutup'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Tetelan Sapi'),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: () {
              showFilterDialog(context);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Cari produk...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          Expanded(
            child: filteredProducts.isEmpty
                ? Center(
                    child: Text(
                      'Tidak ada produk yang tersedia.',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  )
                : GridView.builder(
                    padding: const EdgeInsets.all(8.0),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 8.0,
                      childAspectRatio: 3 / 4,
                    ),
                    itemCount: filteredProducts.length,
                    itemBuilder: (context, index) {
                      final product = filteredProducts[index];
                      final isInCart = cartItems.contains(index);

                      return Card(
                        elevation: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Container(
                                width: double.infinity,
                                child: Image.asset(
                                  product['image']!,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product['name']!,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    product['store']!,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                product['price']!,
                                style: TextStyle(
                                  color: Color(0xFF6A1B1B),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    if (isInCart) {
                                      cartItems.remove(index);
                                      showNotification(context,
                                          '${product['name']} dihapus dari keranjang');
                                    } else {
                                      cartItems.add(index);
                                      showNotification(context,
                                          '${product['name']} ditambahkan ke keranjang');
                                    }
                                  });
                                },
                                child: Icon(Icons.add, color: Colors.white),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: isInCart
                                      ? const Color.fromARGB(255, 106, 27, 27)
                                      : const Color.fromARGB(255, 244, 67,
                                          54), // Ubah warna berdasarkan status
                                  shape: CircleBorder(),
                                  padding: EdgeInsets.all(8),
                                ),
                              ),
                            ),
                          ],
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
