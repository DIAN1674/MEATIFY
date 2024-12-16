import 'package:flutter/material.dart';
import 'package:ritmaflow/bisdig/alamat.dart';
import 'package:ritmaflow/bisdig/inv.dart';
import 'package:ritmaflow/bisdig/riwayat.dart';
import 'package:ritmaflow/bisdig/utama3.dart';
import 'editprofile.dart';
import 'setting.dart';

void main() {
  runApp(const meatprofile());
}

class meatprofile extends StatelessWidget {
  const meatprofile({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Roboto',
      ),
      home: const ProfilePage(),
      routes: {
        '/editprofile': (context) => const editprofile(),
        '/settings': (context) => const meatsetting(),
        '/riwayatpesanan': (context) => const PaymentHistoryPage(),
        '/address': (context) => const meatalamat(),
        '/investasi': (context) => InvestorDagingPage(),
      },
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          '',
          style: TextStyle(color: Colors.black),
        ),
        leading: const SizedBox(), // Empty leading for alignment
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 35,
                  backgroundImage: NetworkImage(
                      'https://via.placeholder.com/150'), // Replace with actual image
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'BISDIG A5',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'lmshuvo97@gmail.com',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView(
              children: [
                _buildListItem(
                    Icons.person, 'Edit Profil', context, '/editprofile'),
                _buildListItem(
                    Icons.location_on, 'Alamat Saya', context, '/address'),
                _buildListItem(Icons.credit_card, 'Riwayat Pembayaran', context,
                    '/riwayatpesanan'),
                _buildListItem(
                    Icons.settings, 'Pengaturan', context, '/settings'),
                _buildListItem(
                    Icons.money, 'Investasi saya', context, '/investasi'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.brown,
                minimumSize: const Size(double.infinity, 50),
              ),
              onPressed: () {
                Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const LoginPage();
                    },
                  ),
                  (_) => false,
                );
              },
              icon: const Icon(Icons.logout, color: Colors.green),
              label: const Text(
                'Log Out',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListItem(
      IconData icon, String title, BuildContext context, String route) {
    return ListTile(
      leading: Icon(icon, color: Colors.brown),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {
        Navigator.pushNamed(context, route); // Navigate to the selected route
      },
    );
  }
}
