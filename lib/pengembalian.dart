import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Import untuk format harga
import 'package:google_fonts/google_fonts.dart';

class MyReturnScreen extends StatefulWidget {
  @override
  _MyReturnScreenState createState() => _MyReturnScreenState();
}

class _MyReturnScreenState extends State<MyReturnScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  final List<Map<String, dynamic>> orders = [
    {
      'name': 'Kompor',
      'price': 15000,
      'quantity': 1,
      'image': 'assets/kompor.jpg',
    },
    {
      'name': 'Carrier',
      'price': 25000,
      'quantity': 1,
      'image': 'assets/carrier.jpg',
    },
    {
      'name': 'Sepatu Gunung',
      'price': 30000,
      'quantity': 1,
      'image': 'assets/sepatugunungp.jpg',
    },
  ];

  final List<Map<String, dynamic>> complete = [
    {
      'name': 'Jaket',
      'price': 18000,
      'quantity': 2,
      'image': 'assets/jaket.jpg',
    },
    {
      'name': 'Tenda Outdoor (2 orang)',
      'price': 40000,
      'quantity': 1,
      'image': 'assets/tenda2.jpg',
    },
  ];

  final List<Map<String, dynamic>> cancelled = [
    {
      'name': 'Sleeping Bag',
      'price': 20000,
      'quantity': 1,
      'image': 'assets/sleepingbag.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text("Pengembalian", style: GoogleFonts.poppins(color: Colors.black)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Kembali ke layar sebelumnya
          },
        ),
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.black,
          indicatorColor: Colors.black,
          unselectedLabelColor: Colors.grey,
          tabs: [Tab(text: "Proses"), Tab(text: "Selesai"), Tab(text: "Batal")],
          labelStyle: GoogleFonts.poppins(),
          unselectedLabelStyle: GoogleFonts.poppins(),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildOrderList(orders, "Lacak Pengembalian"),
          _buildOrderList(complete, "Selesai"),
          _buildOrderList(cancelled, "Batal"),
        ],
      ),
    );
  }

  Widget _buildOrderList(List<Map<String, dynamic>> orderList, String buttonText) {
    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: orderList.length,
      itemBuilder: (context, index) {
        var order = orderList[index];

        return Card(
          margin: EdgeInsets.symmetric(vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    order['image'],
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                    errorBuilder:
                        (context, error, stackTrace) =>
                            Icon(Icons.image, size: 50, color: Colors.grey),
                  ),
                ),
                SizedBox(width: 16),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        order['name'],
                        style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 4),
                      Text("Qty: ${order['quantity']} pcs", style: GoogleFonts.poppins()),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "RP. ${NumberFormat("#,###", "id_ID").format(order['price'])}",
                      style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 6),
                    SizedBox(
                      height: 25,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black, // Warna latar belakang tombol
                          foregroundColor: Colors.white, // Warna teks tombol menjadi putih
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 12),
                        ),
                        child: Text(
                          buttonText, 
                          style: GoogleFonts.poppins(fontSize: 12),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
