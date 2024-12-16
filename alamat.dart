import 'package:flutter/material.dart';
import 'package:ritmaflow/bisdig/profile.dart';
import 'package:ritmaflow/bisdig/tambahalamat.dart';

void main() {
  runApp(const meatalamat());
}

class meatalamat extends StatelessWidget {
  const meatalamat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AlamatSayaScreen(),
    );
  }
}

class AlamatSayaScreen extends StatelessWidget {
  final List<Map<String, String>> addresses = [
    {
      "name": "Nandha Aulia",
      "phone": "+6285753762935",
      "address":
          "Jl. Giri Rejo Km.25 Rt 07, Kost ITK, Karang Joang, Balikpapan Utara, Kalimantan Timur  ID 74262",
    },
    {
      "name": "Nur Fadilah",
      "phone": "+6285723762930",
      "address":
          "Jl. Sein Wain Km.91 Rt 10, Kost Pink, Karang Joang, Balikpapan Utara, Kalimantan Timur  ID 71139",
    },
    {
      "name": "Ni Putu Dian",
      "phone": "+628572045315",
      "address":
          "Jl. Sudirman Km.18 Rt 21, Toko Dian, Kampung Timur, Balikpapan Timur, Kalimantan Timur  ID 74262",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => meatprofile()),
            );
          },
        ),
        title: const Text(
          "Alamat Saya",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16.0),
        itemCount: addresses.length,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          final item = addresses[index];
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.location_on,
                color: Colors.brown,
                size: 24,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item["name"]!,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item["phone"]!,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item["address"]!,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        color: Colors.white,
        child: ElevatedButton.icon(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => tambahalamat()),
            );
          },
          icon: const Icon(Icons.add, color: Colors.white),
          label: const Text(
            "Tambahkan Alamat Baru",
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.brown,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
      ),
    );
  }
}
