import 'package:flutter/material.dart';

void main() {
  runApp(VerifyCodeApp());
}

class VerifyCodeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: VerificationCodeScreen(),
    );
  }
}

class VerificationCodeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:
          false, // Prevent content from resizing when keyboard appears
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    "images/foto3.png"), // Replace with your asset image
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.2), // Transparency for background
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
                  SizedBox(height: 40), // Top spacing
                  // Back Icon and Text
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back, color: Colors.black),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      Text(
                        "Back",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF6A1B1B),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20), // Spacing after back
                  // Title
                  Text(
                    "Masukkan Verifikasi Kode",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF6A1B1B),
                    ),
                  ),
                  SizedBox(height: 10),
                  // Subtitle
                  Text(
                    "Kami telah mengirimkan kode verifikasi ke nomor telepon Anda.",
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF6A1B1B),
                    ),
                  ),
                  SizedBox(height: 30),
                  // Verification Code Input
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(6, (index) {
                      return _buildCodeInputField(context);
                    }),
                  ),
                  SizedBox(height: 40),
                  // Submit Button
                  ElevatedButton(
                    onPressed: () {
                      // Handle verification code submission
                      print("Verifikasi code dikirimkan");
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF6A1B1B), // Button color
                      minimumSize:
                          Size(double.infinity, 50), // Full-width button
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: Text(
                      "verifikasi",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 20), // Spacing before resend
                  // Resend Code Button
                  GestureDetector(
                    onTap: () {
                      // Handle resend code logic (e.g., API call)
                      print("Code dikirim ulang");
                    },
                    child: Center(
                      child: Text(
                        "Kirim ulang kode",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF6A1B1B),
                          decoration:
                              TextDecoration.underline, // Underline text
                        ),
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

  // Single code input field
  Widget _buildCodeInputField(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.black12),
        color: Colors.white,
      ),
      child: TextField(
        keyboardType: TextInputType.number, // Ensure numeric keyboard
        maxLength: 1, // Single digit
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        decoration: InputDecoration(
          border: InputBorder.none,
          counterText: "", // Hide character count
        ),
      ),
    );
  }
}
