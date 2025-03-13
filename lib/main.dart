import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Import Google Fonts
import 'dart:ui';
import 'chat.dart'; 
import 'rincian_item.dart';
import 'halaman_depan.dart';
import 'wishlist.dart';
import 'keranjang.dart';
import 'monitor.dart';
import 'pembelian_paket.dart';
import 'pengembalian.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ServiceScreen(),
      routes: {
        '/chat': (context) => ChatScreen(),
        '/rincian_item': (context) => RincianItem(),
        '/halaman_depan': (context) => HomeScreen(),
        '/wishlist': (context) => WishlistScreen(),
        '/keranjang': (context) => CartScreen(),
        '/monitor': (context) => MyOrdersScreen(),
        '/pembelian_paket': (context) => RincianPaket(),
        '/pengembalian': (context) => MyReturnScreen(),
      },
    );
  }
}

class ServiceScreen extends StatelessWidget {
  final List<Map<String, dynamic>> services = [
    {'icon': Icons.home, 'label': 'Halaman Depan', 'route': '/halaman_depan'},
    {'icon': Icons.inventory, 'label': 'Rincian Item', 'route': '/rincian_item'},
    {'icon': Icons.chat, 'label': 'Chat', 'route': '/chat'},
    {'icon': Icons.favorite, 'label': 'Wishlist', 'route': '/wishlist'},
    {'icon': Icons.shopping_cart, 'label': 'Keranjang & Checkout', 'route': '/keranjang'},
    {'icon': Icons.shopping_basket, 'label': 'Pembelian Paket', 'route': '/pembelian_paket'},
    {'icon': Icons.local_shipping, 'label': 'Monitor Pesanan', 'route': '/monitor'},
    {'icon': Icons.assignment_return, 'label': 'Pengembalian', 'route': '/pengembalian'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/background.jpeg', 
            fit: BoxFit.cover,
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(color: Colors.black.withOpacity(0.3)),
          ),
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  width: 280,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.white.withOpacity(0.2)),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Quiz 1: UI',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 10),
                      GridView.builder(
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                        ),
                        itemCount: services.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              if (services[index]['route'] != null) {
                                Navigator.pushNamed(
                                  context,
                                  services[index]['route'],
                                );
                              }
                            },
                            borderRadius: BorderRadius.circular(15),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.25),
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 5,
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    services[index]['icon'],
                                    color: Colors.white,
                                    size: 32,
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    services[index]['label'],
                                    style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}