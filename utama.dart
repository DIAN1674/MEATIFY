import 'package:flutter/material.dart';
import 'utama3.dart';

void main() => runApp(MeatifyApp());

class MeatifyApp extends StatelessWidget {
  const MeatifyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MeatifyPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MeatifyPage extends StatelessWidget {
  const MeatifyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF642929), // Background color
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                // Navigasi ke halaman berikutnya
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MeatifyHomePage()),
                );
              },
              child: Container(
                width: 400,
                height: 400,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/metify.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}

class MeatifyHomePage extends StatelessWidget {
  const MeatifyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meatify Home'),
        backgroundColor: const Color(0xFF6A1B1B),
        actions: [
          IconButton(
            onPressed: () {
              // Logout action: Clear the navigation stack and navigate to the login page
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
                (route) => false,
              );
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'images/foto1.png'), // Replace with your image path
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Text and button at the bottom
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(
                  bottom: 40.0), // Adjust bottom padding as needed
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Selamat Datang\nDi Meatify',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Dapatkan daging segar anda disini',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF6A1B1B), // Button color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 12),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      ); // Action when button is pressed
                    },
                    child: const Text(
                      'Masuk',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
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
