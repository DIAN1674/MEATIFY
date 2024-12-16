import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

void main() {
  runApp(Inputnumberphone());
}

class Inputnumberphone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PhoneNumberInputScreen(),
    );
  }
}

class PhoneNumberInputScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image:
                    AssetImage("images/foto3.png"), // Ganti dengan asset Anda
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.2), // Transparansi background
                  BlendMode.darken,
                ),
              ),
            ),
          ),
          // Content
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 40), // Jarak dari atas
                  // Row for Icon and Back Text
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back,
                            color: Colors.black), // Ikon back
                        onPressed: () {
                          Navigator.pop(context); // Navigasi kembali
                        },
                      ),
                      Text(
                        "Kembali",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF6A1B1B), // Warna hitam
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10), // Jarak setelah Back
                  // Title
                  Text(
                    "Masukkan nomor hp anda",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF6A1B1B), // Warna hitam
                    ),
                  ),
                  SizedBox(height: 20), // Jarak setelah judul
                  // Subtitle
                  Text(
                    "Nomor HP",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black, // Warna hitam
                    ),
                  ),
                  SizedBox(height: 10),
                  // Phone Number Input
                  IntlPhoneField(
                    keyboardType: TextInputType.phone, // Keyboard numerik
                    decoration: InputDecoration(
                      labelText: 'Nomor HP',
                      labelStyle: TextStyle(color: Colors.black54),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(
                          color: Color(0xFF6A1B1B),
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    initialCountryCode: 'ID', // Default Indonesia
                    onChanged: (phone) {
                      print(phone.completeNumber); // Cetak nomor lengkap
                    },
                  ),
                  SizedBox(height: 20),
                  // Submit Button
                  ElevatedButton(
                    onPressed: () {
                      // Aksi untuk tombol
                      print("Nomor HP submitted");
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF6A1B1B), // Warna tombol
                      minimumSize:
                          Size(double.infinity, 50), // Tombol full width
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: Text(
                      "Lanjutkan",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
