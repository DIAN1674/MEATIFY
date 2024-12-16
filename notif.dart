import 'package:flutter/material.dart';

void main() {
  runApp(const NotificationPage());
}

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  bool isEmailNotificationEnabled = true;
  bool isPushNotificationEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Notifikasi Daging Telah Tiba',
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
          _buildToggleItem(
            title: 'Notifikasi Email',
            value: isEmailNotificationEnabled,
            onChanged: (bool value) {
              setState(() {
                isEmailNotificationEnabled = value;
              });
            },
          ),
          _buildToggleItem(
            title: 'Notifikasi Push',
            value: isPushNotificationEnabled,
            onChanged: (bool value) {
              setState(() {
                isPushNotificationEnabled = value;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildToggleItem({
    required String title,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      trailing: Switch(
        value: value,
        onChanged: onChanged,
        activeColor: Colors.brown,
      ),
    );
  }
}

class MeatProfile extends StatelessWidget {
  const MeatProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: const Center(
        child: Text('Profile Page'),
      ),
    );
  }
}
