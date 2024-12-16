import 'package:flutter/material.dart';
import 'package:ritmaflow/bisdig/beranda.dart';
import 'login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Hilangkan banner debug
      home: DaftarScreen(),
    );
  }
}

class DaftarScreen extends StatefulWidget {
  @override
  _DaftarScreenState createState() => _DaftarScreenState();
}

class _DaftarScreenState extends State<DaftarScreen> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image:
                    AssetImage('images/foto4.png'), // Ganti dengan path gambar
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Foreground Content
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 80),
                  // Logo
                  Center(
                    child: Image.asset(
                      'images/meat.png', // Ganti dengan path logo
                      height: 80,
                    ),
                  ),
                  SizedBox(height: 20),
                  // Title
                  Text(
                    "Daftar",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF6A1B1B),
                    ),
                  ),
                  SizedBox(height: 10),
                  // Subtitle
                  Text(
                    "Masukkan email dan kata sandi anda",
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF6A1B1B),
                    ),
                  ),
                  SizedBox(height: 30),
                  // Name Input
                  TextField(
                    decoration: InputDecoration(
                      labelText: "Nama",
                      border: UnderlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 30),
                  // Email Input
                  TextField(
                    decoration: InputDecoration(
                      labelText: "Email",
                      border: UnderlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20),
                  // Password Input
                  TextField(
                    obscureText: !_isPasswordVisible,
                    decoration: InputDecoration(
                      labelText: "Kata Sandi",
                      border: UnderlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  // Forgot Password
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Lupa Kata Sandi?",
                        style: TextStyle(color: Colors.black54),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  // Register Button
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MeatifyApp(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF6A1B1B),
                      minimumSize: Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      "Daftar",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 20),
                  // Login Link
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Sudah punya akun? ",
                        style: TextStyle(
                          color: Color(0xFF6A1B1B),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                          );
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(
                            color: Color(0xFF6A1B1B),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
