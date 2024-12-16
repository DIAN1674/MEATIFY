import 'package:flutter/material.dart';

class ProductDetailPage extends StatefulWidget {
  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int quantity = 1;
  double selectedWeight = 1; // Ubah ke tipe double untuk slider
  final Map<int, int> weightOptions = {
    1: 65000,
    2: 130000,
    3: 195000,
    4: 260000,
    5: 325000
  };
  double rating = 0;
  String comment = '';
  bool isFavorite = false; // Menyimpan status favorit produk

  void incrementQuantity() {
    setState(() {
      quantity++;
    });
  }

  void decrementQuantity() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
    }
  }

  void submitComment() {
    // Validasi jika komentar kosong atau rating 0
    if (comment.isNotEmpty && rating > 0) {
      // Jika perlu, Anda bisa menambahkan logika untuk mengirim komentar ke server atau menyimpannya secara lokal
      setState(() {
        comment = ''; // Reset komentar setelah kirim
        rating = 0; // Reset rating setelah kirim
      });
    } else {
      // Menampilkan Snackbar jika ada kesalahan
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Komentar atau rating tidak boleh kosong!'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
    // Menampilkan pemberitahuan Snackbar ketika produk ditambahkan atau dihapus dari favorit
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(isFavorite
            ? 'Produk ditambahkan ke favorit!'
            : 'Produk dihapus dari favorit!'),
        backgroundColor: isFavorite ? Colors.green : Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Mengonversi selectedWeight menjadi integer saat mengakses weightOptions
    int totalPrice = weightOptions[selectedWeight.toInt()]! * quantity;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          // Ikon Favorit
          IconButton(
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : Colors.black,
            ),
            onPressed: toggleFavorite,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Bagian Gambar
            Center(
              child: Image.asset(
                'images/dagingsirloin.png',
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 16),
            // Nama Produk
            Text(
              'Daging Sapi Sirloin',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              '1kg, Toko Tanderloin',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            SizedBox(height: 16),
            // Deskripsi Produk
            Text(
              'Daging Sapi Sirloin adalah pilihan premium untuk Anda yang menyukai daging dengan tekstur lembut dan rasa gurih. Cocok untuk berbagai olahan masakan, seperti steak, soto, dan lain-lain.',
              style: TextStyle(fontSize: 14, color: Colors.grey[700]),
            ),
            SizedBox(height: 16),
            // Pilihan Kuantitas
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove, color: Colors.black),
                      onPressed: decrementQuantity,
                    ),
                    Text('$quantity', style: TextStyle(fontSize: 18)),
                    IconButton(
                      icon: Icon(Icons.add, color: Colors.black),
                      onPressed: incrementQuantity,
                    ),
                  ],
                ),
                Text(
                  'Rp. $totalPrice',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 16),
            // Pilihan Berat Menggunakan Slider
            Text(
              'Pilih Berat: ${selectedWeight.toInt()} KG',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Slider(
              value: selectedWeight,
              min: 1,
              max: 5,
              divisions: 4, // Membagi slider menjadi 4 bagian (1-5 kg)
              label: '${selectedWeight.toInt()} KG',
              onChanged: (double value) {
                setState(() {
                  selectedWeight = value;
                });
              },
            ),
            SizedBox(height: 16),
            // Tombol Beli
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Produk ditambahkan ke keranjang!'),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                'Tambahkan ke Keranjang',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
            SizedBox(height: 24),
            // Ulasan dan Rating
            Text(
              'Berikan Rating dan Komentar:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            // Rating Bintang
            Row(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.star,
                    color: rating >= 1 ? Colors.yellow : Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      rating = 1;
                    });
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.star,
                    color: rating >= 2 ? Colors.yellow : Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      rating = 2;
                    });
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.star,
                    color: rating >= 3 ? Colors.yellow : Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      rating = 3;
                    });
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.star,
                    color: rating >= 4 ? Colors.yellow : Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      rating = 4;
                    });
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.star,
                    color: rating >= 5 ? Colors.yellow : Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      rating = 5;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 8),
            // Kolom Komentar
            TextField(
              onChanged: (value) {
                setState(() {
                  comment = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Tulis komentar Anda...',
                border: OutlineInputBorder(),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
              ),
              maxLines: 3,
            ),
            SizedBox(height: 16),
            // Tombol Kirim Komentar
            ElevatedButton(
              onPressed: submitComment,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                'Kirim Komentar',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
            SizedBox(height: 24),
            // Ulasan Pengguna yang Ada
            Text(
              'Ulasan Pengguna:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            // Daftar Ulasan Pengguna
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Rating bintang dari pengguna lain
                    Row(
                      children: List.generate(5, (index) {
                        return Icon(
                          Icons.star,
                          color: index < 4
                              ? Colors.yellow
                              : Colors.grey, // Rating 4 bintang
                          size: 20,
                        );
                      }),
                    ),
                    SizedBox(height: 8),
                    // Komentar dari pengguna lain
                    Text(
                      'Daging sapi kualitas terbaik, sangat lezat untuk dibuat steak!',
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
