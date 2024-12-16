import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: DagingTerlarisPage(),
  ));
}

class DagingTerlarisPage extends StatefulWidget {
  @override
  _DagingTerlarisPageState createState() => _DagingTerlarisPageState();
}

class _DagingTerlarisPageState extends State<DagingTerlarisPage> {
  // Daftar produk
  final List<Map<String, String>> products = [
    {
      'name': 'Daging Sapi Sirloin',
      'price': 'Rp. 65.000',
      'image': 'images/dagingsirloin.png',
      'store': '1 Kg, Toko Premium',
    },
    {
      'name': 'Daging Tenderloin',
      'price': 'Rp.140.000',
      'image': 'images/dagingtenderloin.png',
      'store': '1 Kg, Toko Sepinggan',
    },
    {
      'name': 'Daging Sengkel',
      'price': 'Rp. 90.000',
      'image': 'images/dagingsengkel.png',
      'store': '1 Kg, Toko Halal',
    },
    {
      'name': 'Tetelan Sapi Wagyu',
      'price': 'Rp. 63.000',
      'image': 'images/tetelansapiprem.png',
      'store': '1 Kg, Toko Wagyu',
    },
    {
      'name': 'Tetelan Bakso',
      'price': 'Rp. 65.000',
      'image': 'images/tetelansapiprem.png',
      'store': '1 Kg, Toko Bakso',
    },
    {
      'name': 'Tetelan Daging',
      'price': 'Rp. 63.000',
      'image': 'images/tetelansapiprem.png',
      'store': '1 Kg, Toko Daging',
    },
  ];

  // Daftar toko yang dapat difilter
  final List<String> stores = [
    'Toko Premium',
    'Toko Wagyu',
    'Toko Bakso',
    'Toko Daging',
    'Toko Sepinggan',
    'Toko Halal'
  ];

  // Toko yang dipilih untuk filter
  List<String> selectedStores = ['Toko Premium']; // Default filter

  // Status untuk tombol 'add' per produk
  late List<bool> isAddedList;

  @override
  void initState() {
    super.initState();
    isAddedList = List.generate(products.length, (_) => false);
  }

  // Memfilter produk berdasarkan toko yang dipilih
  List<Map<String, String>> get filteredProducts {
    if (selectedStores.isEmpty) return [];

    return products.where((product) {
      final storeName = product['store']?.split(',').last.trim();
      return storeName != null && selectedStores.contains(storeName);
    }).toList();
  }

  // Menampilkan pop-up filter toko
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
        title: Text('Daging Terlaris'),
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
                                    isAddedList[index] = !isAddedList[index];
                                  });

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(isAddedList[index]
                                          ? '${product['name']} ditambahkan ke keranjang'
                                          : '${product['name']} dihapus dari keranjang'),
                                      duration: Duration(seconds: 3),
                                    ),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: CircleBorder(),
                                  padding: EdgeInsets.all(8),
                                  backgroundColor: isAddedList[index]
                                      ? const Color.fromARGB(255, 106, 27, 27)
                                      : Colors.red,
                                ),
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
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
