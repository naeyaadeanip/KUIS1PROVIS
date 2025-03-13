import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Import untuk format harga
import 'package:google_fonts/google_fonts.dart';
import 'chat.dart';
import 'halaman_depan.dart';
import 'wishlist.dart';
import 'keranjang.dart';
import 'rincian_item.dart';

class MyOrdersScreen extends StatefulWidget {
  @override
  _MyOrdersScreenState createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 4; // Default icon love aktif

  void _onItemTapped(int index) {
    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } else if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ChatScreen()),
      );
    }  else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => RincianItem()),
      );
    } else if (index == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => WishlistScreen()),
      );
    } else if (index == 5) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CartScreen()),
      );
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

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
        title: Text("Pesanan", style: GoogleFonts.poppins(color: Colors.black)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.black,
          indicatorColor: Colors.black,
          unselectedLabelColor: Colors.grey,
          tabs: [
            Tab(text: "Proses"),
            Tab(text: "Selesai"),
            Tab(text: "Batal"),
          ],
          labelStyle: GoogleFonts.poppins(),
          unselectedLabelStyle: GoogleFonts.poppins(),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildOrderList(orders, "Lacak Pesanan"),
          _buildOrderList(complete, "Kembalikan"),
          _buildOrderList(cancelled, "Batal"),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.9),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              spreadRadius: 2,
            ),
          ],
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.deepPurple,
          unselectedItemColor: Colors.grey,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          onTap: _onItemTapped,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
            BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Pesan'),
            BottomNavigationBarItem(icon: Icon(Icons.inventory), label: 'Item'),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Wishlist'),
            BottomNavigationBarItem(icon: Icon(Icons.phone_android), label: 'Transaksi'),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Keranjang'),
          ],
          selectedLabelStyle: GoogleFonts.poppins(),
          unselectedLabelStyle: GoogleFonts.poppins(),
        ),
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
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    order['image'],
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(order['name'], style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
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
