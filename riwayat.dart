import 'package:flutter/material.dart';

void main() {
  runApp(const riwayat());
}

class riwayat extends StatelessWidget {
  const riwayat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: const PaymentHistoryPage(),
    );
  }
}

class PaymentHistoryPage extends StatelessWidget {
  const PaymentHistoryPage({Key? key}) : super(key: key);

  void _onBuyAgainPressed(BuildContext context, String productDetails) {
    // Menampilkan snackbar sebagai feedback
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
            'Anda membeli lagi: $productDetails, Silahkan dicek di keranjang anda'),
        duration: const Duration(seconds: 2),
      ),
    );

    // Tambahkan logika lain di sini (misalnya, navigasi atau memproses ulang pembelian)
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Riwayat Pembayaran',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildPaymentItem(
            context: context,
            storeName: 'Toko Daging Halal',
            productDetails: 'Daging Sirloin, Daging Tenderloin',
            date: '01/Des/2024',
            price: 'Rp. 150.000',
          ),
          _buildPaymentItem(
            context: context,
            storeName: 'Toko Daging Halal',
            productDetails: 'Daging Iga Sapi, Daging Tetelan',
            date: '23/Nov/2024',
            price: 'Rp. 175.000',
          ),
          _buildPaymentItem(
            context: context,
            storeName: 'Toko Daging Halal',
            productDetails: 'Daging Tenderloin',
            date: '16/Nov/2024',
            price: 'Rp. 60.000',
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentItem({
    required BuildContext context,
    required String storeName,
    required String productDetails,
    required String date,
    required String price,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                storeName,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              Text(
                date,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            productDetails,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton.icon(
                onPressed: () => _onBuyAgainPressed(context, productDetails),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown,
                  padding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 16.0,
                  ),
                ),
                icon: const Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                ),
                label: const Text(
                  'Beli lagi',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Text(
                price,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          const Divider(height: 32, thickness: 1),
        ],
      ),
    );
  }
}
