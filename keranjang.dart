import 'package:flutter/material.dart';
import 'checkout.dart';

void main() {
  runApp(keranjang());
}

class keranjang extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CartPage(),
    );
  }
}

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final List<Map<String, dynamic>> cartItems = [
    {
      'name': 'Daging Tenderloin',
      'quantity': 1,
      'price': 115000,
      'weight': '1Kg',
      'storeName': 'Toko Sapi Maju',
    },
    {
      'name': 'Daging Sirloin',
      'quantity': 1,
      'price': 110000,
      'weight': '1Kg',
      'storeName': 'Toko Sapi Bersih',
    },
    {
      'name': 'Daging Sengkel',
      'quantity': 1,
      'price': 90000,
      'weight': '1Kg',
      'storeName': 'Toko Daging Segar',
    },
    {
      'name': 'Iga Sapi',
      'quantity': 1,
      'price': 120000,
      'weight': '2Kg',
      'storeName': 'Toko Premium Meat',
    },
  ];

  int calculateTotalPrice() {
    int totalPrice = 0;
    for (var item in cartItems) {
      final quantity = item['quantity'] as int;
      final price = item['price'] as int;
      totalPrice += quantity * price;
    }
    return totalPrice;
  }

  void incrementQuantity(int index) {
    setState(() {
      cartItems[index]['quantity']++;
    });
  }

  void decrementQuantity(int index) {
    setState(() {
      if (cartItems[index]['quantity'] > 1) {
        cartItems[index]['quantity']--;
      }
    });
  }

  void _deleteItem(int index) {
    setState(() {
      cartItems.removeAt(index);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Item berhasil dihapus!'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    int totalPrice = calculateTotalPrice();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Keranjang',
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
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'images/dagingsirloin.png', // Placeholder image
                        width: 60,
                        height: 60,
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item['name'] ?? 'Nama tidak tersedia',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              item['storeName'] ?? 'Toko tidak tersedia',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[600],
                              ),
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                IconButton(
                                  icon: Icon(Icons.remove),
                                  onPressed: () {
                                    decrementQuantity(index);
                                  },
                                ),
                                Text(item['quantity'].toString()),
                                IconButton(
                                  icon: Icon(Icons.add),
                                  onPressed: () {
                                    incrementQuantity(index);
                                  },
                                ),
                                SizedBox(width: 8),
                                Text(
                                  'Rp ${(item['quantity'] * item['price']).toString()}',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          _deleteItem(index);
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total: Rp $totalPrice',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Navigasi ke halaman Checkout dengan membawa cartItems dan totalPrice
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CheckoutPage(
                          cartItems: cartItems,
                          totalPrice: calculateTotalPrice(),
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.brown,
                  ),
                  child: Text(
                    'Bayar Sekarang',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
