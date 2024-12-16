import 'package:flutter/material.dart';

class CheckoutPage extends StatefulWidget {
  final List<Map<String, dynamic>> cartItems;
  final int totalPrice;

  CheckoutPage({required this.cartItems, required this.totalPrice});

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  String address = '';
  String note = '';
  String selectedPackaging = '';
  String selectedPayment = '';
  String selectedPaymentDetail = '';
  String selectedDiscount = '';
  int packagingCost = 0;
  int discountValue = 0;

  @override
  Widget build(BuildContext context) {
    int finalPrice = widget.totalPrice + packagingCost - discountValue;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Checkout',
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Rincian Pembelian',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: widget.cartItems.length,
                itemBuilder: (context, index) {
                  final item = widget.cartItems[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      children: [
                        Image.asset(
                          'images/dagingsirloin.png',
                          width: 50,
                          height: 50,
                        ),
                        SizedBox(width: 16),
                        Text(
                          '${item['name']} x${item['quantity']}',
                          style: TextStyle(fontSize: 16),
                        ),
                        Spacer(),
                        Text(
                          'Rp ${(item['price'] * item['quantity']).toString()}',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              SizedBox(height: 16),
              Divider(),
              SizedBox(height: 8),
              TextField(
                onChanged: (value) => setState(() => address = value),
                decoration: InputDecoration(
                  labelText: 'Alamat',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                onChanged: (value) => setState(() => note = value),
                decoration: InputDecoration(
                  labelText: 'Catatan',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Pilih Jenis Pengemasan',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Column(
                children: [
                  _buildPackagingOption('Vacuum Pack', 5000),
                  _buildPackagingOption('Freezer Paper', 7000),
                  _buildPackagingOption('Styrofoam Box Pendingin', 20000),
                ],
              ),
              SizedBox(height: 16),
              Text(
                'Pilih Jenis Pembayaran',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Column(
                children: [
                  RadioListTile(
                    value: 'Transfer Bank',
                    groupValue: selectedPayment,
                    onChanged: (value) {
                      setState(() {
                        selectedPayment = value.toString();
                        selectedPaymentDetail = 'No. Rekening: 123-456-789';
                      });
                    },
                    title: Text('Transfer Bank'),
                  ),
                  if (selectedPayment == 'Transfer Bank')
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        selectedPaymentDetail,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[700],
                        ),
                      ),
                    ),
                  RadioListTile(
                    value: 'QRIS',
                    groupValue: selectedPayment,
                    onChanged: (value) {
                      setState(() {
                        selectedPayment = value.toString();
                        selectedPaymentDetail = '';
                      });
                    },
                    title: Text('QRIS'),
                  ),
                  if (selectedPayment == 'QRIS')
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Image.asset(
                        'images/LOL.png', // Ganti dengan path gambar QRIS Anda
                        height: 100,
                      ),
                    ),
                ],
              ),
              SizedBox(height: 16),
              Text(
                'Pilih Diskon',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Column(
                children: [
                  _buildDiscountOption('Diskon Rp5.000', 5000),
                  _buildDiscountOption('Diskon Rp10.000', 10000),
                ],
              ),
              SizedBox(height: 16),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total Pembayaran',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Rp $finalPrice',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Pembayaran berhasil!'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown,
                ),
                child: Text(
                  'Konfirmasi Pembayaran',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPackagingOption(String label, int cost) {
    return RadioListTile(
      value: label,
      groupValue: selectedPackaging,
      onChanged: (value) {
        setState(() {
          selectedPackaging = value.toString();
          packagingCost = cost;
        });
      },
      title: Text('$label - Rp $cost'),
    );
  }

  Widget _buildDiscountOption(String label, int value) {
    return RadioListTile(
      value: label,
      groupValue: selectedDiscount,
      onChanged: (selectedValue) {
        setState(() {
          selectedDiscount = selectedValue.toString();
          discountValue =
              value; // Menggunakan nilai parameter `value`, bukan `selectedValue`.
        });
      },
      title: Text(label),
    );
  }
}
