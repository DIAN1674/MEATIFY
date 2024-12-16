import 'package:flutter/material.dart';
import 'alamat.dart';

void main() {
  runApp(tambahalamat());
}

class tambahalamat extends StatelessWidget {
  const tambahalamat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tambah Detail Alamat',
      home: tambahalamatScreen(),
    );
  }
}

class tambahalamatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Detail Alamat'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Nama'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'No Handphone'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Alamat'),
            ),
            // ... Tambahkan TextField lainnya untuk tanggal lahir, email, nomor telepon
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => meatalamat()),
                );
              },
              child: Text('Tambah'),
            ),
          ],
        ),
      ),
    );
  }
}
