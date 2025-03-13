import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'chat.dart';
import 'rincian_item.dart';
import 'halaman_depan.dart';
import 'keranjang.dart';
import 'monitor.dart';

class WishlistScreen extends StatefulWidget {
  @override
  _WishlistScreenState createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  final List<Map<String, dynamic>> products = [
    {'name': 'Tenda Outdoor (2 orang)', 'price': 'RP. 40.000', 'rating': 4.9, 'description': 'Tenda nyaman untuk 2 orang', 'image': 'assets/tenda2.jpg'},
    {'name': 'Sepatu Gunung', 'price': 'RP. 30.000', 'rating': 5.0, 'description': 'Sepatu khusus untuk trekking', 'image': 'assets/sepatugunungp.jpg'},
    {'name': 'Sleeping Bag', 'price': 'RP. 20.000', 'rating': 5.0, 'description': 'Sleeping bag hangat dan nyaman', 'image': 'assets/sleepingbag.jpg'},
  ];

  final List<int> favoriteIndices = [0, 1, 2];

  int _selectedIndex = 3;
  String _selectedCategory = 'Semua';

  void _onItemTapped(int index) {
    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen())
      );
    } else if (index == 1) {
      Navigator.push(
        context, 
        MaterialPageRoute(builder: (context) => ChatScreen())
      );
    } else if (index == 2) {
      Navigator.push(
        context, 
        MaterialPageRoute(builder: (context) => RincianItem())
      );
    } else if (index == 4) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MyOrdersScreen()),
      );
    } else if (index == 5) {
      Navigator.push(
        context, 
        MaterialPageRoute(builder: (context) => CartScreen())
      );
    } else {
      if (mounted) {
        setState(() {
          _selectedIndex = index;
        });
      }
    }
  }

  void _toggleFavorite(int index) {
    setState(() {
      if (favoriteIndices.contains(index)) {
        favoriteIndices.remove(index);
      } else {
        favoriteIndices.add(index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wishlist', style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0), // Padding biar ga mepet
            child: 
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  'Semua',
                  'Ransel',
                  'Alat Masak',
                  'Jaket & Sepatu',
                  'Tenda',
                  'Penerangan',
                  'Alat Tidur',
                  'Lainnya',
                ].map((category) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: ChoiceChip(
                      label: Text(category, style: GoogleFonts.poppins()),
                      selected: _selectedCategory == category,
                      onSelected: (bool selected) {
                        setState(() {
                          _selectedCategory = category;
                        });
                      },
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(16),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.6,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                bool isFavorite = favoriteIndices.contains(index);

                return Card(
                  elevation: 2,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: 120,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(
                                  image: AssetImage(product['image']),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 8,
                              right: 8,
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white.withOpacity(0.7),
                                ),
                                child: IconButton(
                                  icon: Icon(
                                    isFavorite
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color:
                                        isFavorite ? Colors.red : Colors.black,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      if (isFavorite) {
                                        favoriteIndices.remove(index);
                                      } else {
                                        favoriteIndices.add(index);
                                      }
                                    });
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Text(
                          product['name'],
                          style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 4),
                        Text(
                          product['description'],
                          style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey),
                        ),
                        SizedBox(height: 4),
                        Text(
                          product['price'],
                          style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.blue),
                        ),
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.yellow, size: 16),
                            Text(product['rating'].toString(), style: GoogleFonts.poppins(fontSize: 11)),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
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
}