import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'chat.dart';
import 'rincian_item.dart';
import 'wishlist.dart';
import 'keranjang.dart';
import 'monitor.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  String _selectedCategory = 'Semua';

  void _onItemTapped(int index) {
    if (index == 1) {
      // Jika tombol chat ditekan
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ChatScreen()),
      );
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => RincianItem()),
      );
    } else if (index == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => WishlistScreen()),
      );
    }  else if (index == 4) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MyOrdersScreen()),
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Halo, Yudi!',
          style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: 'Cari Produk',
                  hintStyle: GoogleFonts.poppins(),
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: Icon(Icons.tune),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Kategori',
                style: GoogleFonts.poppins(fontSize: 18, fontWeight:FontWeight.bold),
              ),
              SizedBox(height: 8),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children:
                      [
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
              SizedBox(height: 16),
              ProdukCard1(),
              SizedBox(height: 16),
              ProdukCard2(),
              SizedBox(height: 16),
              Text(
                'Paket',
                style: GoogleFonts.poppins(fontSize: 18, fontWeight:FontWeight.bold),
              ),
              SizedBox(height: 8),
              SizedBox(height: 8),
              SizedBox(height: 8),
              Container(
                height: 125, // Sesuaikan dengan tinggi PaketCard
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3, // Jumlah item
                  itemBuilder: (context, index) {
                    List<Widget> paketCards = [
                      PaketCard1(),
                      PaketCard2(),
                      PaketCard3(),
                    ];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: paketCards[index],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
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

class ProdukCard1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.asset(
                'assets/carrier.jpg', // Ganti dengan path gambar di assets
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Carrier', style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
                  Text('Tas gunung besar untuk hiking\nRP. 25.000', style: GoogleFonts.poppins()),
                  Row(
                    children: [
                      Icon(Icons.star, size: 16, color: Colors.amber),
                      Text('4.9', style: GoogleFonts.poppins()),
                    ],
                  ),
                  SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Tambahkan Ke Keranjang', style: GoogleFonts.poppins()),
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

class ProdukCard2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.asset(
                'assets/sleepingbag.jpg', // Ganti dengan path gambar di assets
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Sleeping Bag', style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
                  Text('Sleeping bag hangat dan nyaman\nRP. 20.000', style: GoogleFonts.poppins()),
                  Row(
                    children: [
                      Icon(Icons.star, size: 16, color: Colors.amber),
                      Text('5.0', style: GoogleFonts.poppins()),
                    ],
                  ),
                  SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Tambahkan Ke Keranjang', style: GoogleFonts.poppins()),
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

class PaketCard1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Paket 1', style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
                Text('Tenda Outdoor (2 Orang) +\nSleeping Bag', style: GoogleFonts.poppins()),
                Row(
                  children: [
                    Icon(Icons.star, size: 16, color: Colors.amber),
                    Text('4.9', style: GoogleFonts.poppins()),
                  ],
                ),
                Text(
                  'RP. 50.000',
                  style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PaketCard2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Paket 2', style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
                Text('Carrier + Jaket +\nSepatu Gunung', style: GoogleFonts.poppins()),
                Row(
                  children: [
                    Icon(Icons.star, size: 16, color: Colors.amber),
                    Text('4.9', style: GoogleFonts.poppins()),
                  ],
                ),
                Text(
                  'RP. 70.000',
                  style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PaketCard3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Paket 3', style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
                Text('Tenda Outdoor (4 Orang) +\nCarrier + Sleeping Bag', style: GoogleFonts.poppins()),
                Row(
                  children: [
                    Icon(Icons.star, size: 16, color: Colors.amber),
                    Text('5.0', style: GoogleFonts.poppins()),
                  ],
                ),
                Text(
                  'RP. 100.000',
                  style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}