import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InvestorDagingPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class InvestorDagingPage extends StatefulWidget {
  @override
  _InvestorDagingPageState createState() => _InvestorDagingPageState();
}

class _InvestorDagingPageState extends State<InvestorDagingPage> {
  double totalInvestment = 300000000;
  double monthlyProfit = 12000000;
  DateTime? lastInvestmentDate;

  final List<Map<String, dynamic>> stores = [
    {
      'name': 'Daging Premium Balikpapan',
      'description':
          'Investasi pada ekspansi dan pengembangan stok daging berkualitas tinggi.',
      'profit': 8000000.0,
      'investment': 50000000.0,
    },
    {
      'name': 'Daging Organik Nusantara',
      'description':
          'Meningkatkan pasokan daging organik untuk pasar lokal dan ekspor.',
      'profit': 4000000.0,
      'investment': 100000000.0,
    },
  ];

  void _addInvestment(double amount) {
    setState(() {
      totalInvestment += amount;
      monthlyProfit += amount * 0.04; // Assume 4% monthly profit
      lastInvestmentDate = DateTime.now();
    });
  }

  bool _canInvest() {
    if (lastInvestmentDate == null) return true;
    final now = DateTime.now();
    return now.year > lastInvestmentDate!.year ||
        now.month > lastInvestmentDate!.month;
  }

  double get overallMonthlyProfit =>
      stores.fold(0.0, (sum, store) => sum + store['profit']);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Investor Toko Daging',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Informasi Utama
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Selamat Datang, Investor!',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Total Investasi Anda:',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Rp ${totalInvestment.toStringAsFixed(0)}',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Keuntungan Bulanan Keseluruhan: Rp ${overallMonthlyProfit.toStringAsFixed(0)}',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 24),
              // Proyek yang Didukung
              Text(
                'Proyek Toko Daging yang Didukung',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              ...stores.map((store) => ProjectCard(
                    title: store['name'],
                    description: store['description'],
                    profit:
                        'Keuntungan: Rp ${store['profit'].toStringAsFixed(0)} / bulan',
                    investment: 'Rp ${store['investment'].toStringAsFixed(0)}',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProjectDetailsPage(
                            title: store['name'],
                            description: store['description'],
                            totalInvestment: store['investment'],
                            onAddInvestment: (amount) {
                              if (_canInvest()) {
                                _addInvestment(amount);
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                        'Anda hanya bisa berinvestasi sekali sebulan!'),
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                      );
                    },
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  final String title;
  final String description;
  final String profit;
  final String investment;
  final VoidCallback onTap;

  ProjectCard({
    required this.title,
    required this.description,
    required this.profit,
    required this.investment,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      margin: EdgeInsets.symmetric(vertical: 8),
      elevation: 2,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.green,
          child: Icon(Icons.store, color: Colors.white),
        ),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 4),
            Text(description),
            SizedBox(height: 4),
            Text(profit, style: TextStyle(color: Colors.green)),
          ],
        ),
        trailing: Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}

class ProjectDetailsPage extends StatelessWidget {
  final String title;
  final String description;
  final double totalInvestment;
  final Function(double) onAddInvestment;

  ProjectDetailsPage({
    required this.title,
    required this.description,
    required this.totalInvestment,
    required this.onAddInvestment,
  });

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final _amountController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detail Proyek',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              description,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Minimal Investasi',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Rp 50000/bulan',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Total Investasi Saat Ini',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Rp ${totalInvestment.toStringAsFixed(0)}',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            SizedBox(height: 24),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _amountController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Jumlah Investasi Baru',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Masukkan jumlah investasi';
                      }
                      if (double.tryParse(value) == null ||
                          double.parse(value) < 50000) {
                        return 'Minimal investasi adalah Rp 50.000';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        final amount = double.parse(_amountController.text);
                        onAddInvestment(amount);
                        Navigator.of(context).pop();
                      }
                    },
                    child: Text('Tambah Investasi'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
