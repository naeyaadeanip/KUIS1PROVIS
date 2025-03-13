import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final formatCurrency = NumberFormat("#,##0.00", "id_ID");

  List<Map<String, dynamic>> products = [
    {
      'name': 'Tenda Outdoor (2 orang)',
      'price': 40000,
      'image': 'assets/tenda2.jpg',
      'quantity': 1,
      'selected': true
    },
    {
      'name': 'Kompor Portable',
      'price': 15000,
      'image': 'assets/kompor.jpg',
      'quantity': 1,
      'selected': true
    },
    {
      'name': 'Sleeping Bag',
      'price': 20000,
      'image': 'assets/sleepingbag.jpg',
      'quantity': 2,
      'selected': true
    },
  ];

  double getTotalPrice() {
    return products
        .where((item) => item['selected'])
        .fold(0, (sum, item) => sum + (item['price'] * item['quantity']));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text("Keranjang & Checkout", style: GoogleFonts.poppins(color: Colors.black)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              itemBuilder: (context, index) {
                var product = products[index];

                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: ListTile(
                    leading: Image.asset(
                      product['image'],
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    title: Text(product['name'],
                        style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
                    subtitle: Text("RP. ${formatCurrency.format(product['price'])}",
                        style: GoogleFonts.poppins()),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.remove_circle_outline),
                          onPressed: () {
                            setState(() {
                              if (product['quantity'] > 1) {
                                product['quantity']--;
                              }
                            });
                          },
                        ),
                        Text("x${product['quantity']}", style: GoogleFonts.poppins()),
                        IconButton(
                          icon: Icon(Icons.add_circle_outline),
                          onPressed: () {
                            setState(() {
                              product['quantity']++;
                            });
                          },
                        ),
                      ],
                    ),
                    onTap: () {
                      setState(() {
                        product['selected'] = !product['selected'];
                      });
                    },
                  ),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Pilih Barang",
                    style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                Column(
                  children: products
                      .where((item) => item['selected'])
                      .map((item) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("${item['name']} x${item['quantity']}",
                                    style: GoogleFonts.poppins()),
                                Text(
                                    "RP. ${formatCurrency.format(item['price'] * item['quantity'])}",
                                    style: GoogleFonts.poppins(
                                        color: Colors.orange,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ))
                      .toList(),
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Total Pembayaran",
                        style: GoogleFonts.poppins(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Text("RP. ${formatCurrency.format(getTotalPrice())}",
                        style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.orange)),
                  ],
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    minimumSize: Size(double.infinity, 50),
                  ),
                  onPressed: () {},
                  child: Text("Checkout Sekarang",
                      style: GoogleFonts.poppins(color: Colors.white, fontSize: 16)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
