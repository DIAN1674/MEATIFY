import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For date formatting

class PurchasedItem {
  final String name;
  final String store;
  final int price;
  final int quantity;
  final DateTime purchaseDate;

  PurchasedItem({
    required this.name,
    required this.store,
    required this.price,
    required this.quantity,
    required this.purchaseDate,
  });
}

class PurchaseHistoryScreen extends StatelessWidget {
  final List<PurchasedItem> purchasedItems = [
    PurchasedItem(
      name: 'Daging Tenderloin',
      store: 'Toko Sapi Maju',
      price: 115000,
      quantity: 1,
      purchaseDate: DateTime.now().subtract(Duration(days: 2)),
    ),
    PurchasedItem(
      name: 'Daging Sirloin',
      store: 'Toko Sapi Bersih',
      price: 110000,
      quantity: 1,
      purchaseDate: DateTime.now().subtract(Duration(days: 5)),
    ),
    PurchasedItem(
      name: 'Daging Sengkel',
      store: 'Toko Daging Segar',
      price: 90000,
      quantity: 2,
      purchaseDate: DateTime.now().subtract(Duration(days: 10)),
    ),
    PurchasedItem(
      name: 'Iga Sapi',
      store: 'Toko Premium Meat',
      price: 120000,
      quantity: 1,
      purchaseDate: DateTime.now().subtract(Duration(days: 1)),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Riwayat Pembelian'),
        backgroundColor: Colors.redAccent,
      ),
      body: ListView.builder(
        itemCount: purchasedItems.length,
        itemBuilder: (context, index) {
          final item = purchasedItems[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              leading: Image.asset(
                'assets/meat_placeholder.png', // Replace with actual image
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              title: Text(
                item.name,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                '${item.store}\n${DateFormat('dd MMM yyyy').format(item.purchaseDate)}',
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Rp ${item.price * item.quantity}'),
                  Text('x${item.quantity}',
                      style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
