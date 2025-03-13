import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class RincianPaket extends StatefulWidget {
  @override
  _RincianPaketState createState() => _RincianPaketState();
}

class _RincianPaketState extends State<RincianPaket> {
  final List<Map<String, dynamic>> products = [
    {
      'name': 'Paket 1',
      'price': 'RP. 50.000',
      'rating': 4.9,
      'description': 'Tenda Outdoor (2 Orang) +\nSleeping Bag',
      'image': 'assets/paket1.jpg',
    },
    {
      'name': 'Paket 2',
      'price': 'RP. 70.000',
      'rating': 4.9,
      'description': 'Carrier +\nJaket +\nSepatu Gunung',
      'image': 'assets/paket2.jpg',
    },
    {
      'name': 'Paket 3',
      'price': 'RP. 100.000',
      'rating': 5.0,
      'description': 'Tenda Outdoor (4 Orang) +\nCarrier + Sleeping Bag',
      'image': 'assets/paket3.jpg',
    },
  ];

  final List<int> favoriteIndices = [
    0,
    3,
    5,
  ]; // Hanya beberapa item yang love merah

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pembelian Paket', style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
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
    );
  }
}
