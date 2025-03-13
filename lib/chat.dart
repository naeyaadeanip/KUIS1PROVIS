import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatScreen extends StatelessWidget {
  final List<Map<String, dynamic>> messages = [
    {'isMe': false, 'message': 'Halo! Selamat datang di layanan sewa tenda kami. Ada yang bisa kami bantu?', 'time': '08:30'},
    {'isMe': true, 'message': 'Halo, saya ingin menyewa tenda untuk camping. Masih tersedia?', 'time': '08:31'},
    {'isMe': false, 'message': 'Tentu! Untuk berapa orang dan berapa hari penyewaan?', 'time': '08:32'},
    {'isMe': true, 'message': 'Untuk 4 orang, selama 2 malam.', 'time': '08:33'},
    {'isMe': false, 'message': 'Kami punya tenda dome kapasitas 4-6 orang. Harganya Rp150.000 per malam.', 'time': '08:34'},
    {'isMe': true, 'message': 'Oke, kalau ada tambahan sleeping bag bisa juga?', 'time': '08:35'},
    {'isMe': false, 'message': 'Bisa! Sleeping bag sewa Rp25.000 per malam. Mau tambah berapa?', 'time': '08:36'},
    {'isMe': true, 'message': 'Saya butuh 4 sleeping bag.', 'time': '08:37'},
    {'isMe': false, 'message': 'Baik, totalnya Rp500.000 untuk 2 malam. Kapan jadwal pengambilan?', 'time': '08:38'},
    {'isMe': true, 'message': 'Tanggal 20 Maret pagi. Pembayaran bagaimana?', 'time': '08:39'},
    {'isMe': false, 'message': 'Bisa transfer atau bayar saat pengambilan. Saya kirim detailnya ya.', 'time': '08:40'},
    {'isMe': true, 'message': 'Oke, terima kasih!', 'time': '08:41'},
    {'isMe': false, 'message': 'Sama-sama! 😊', 'time': '08:42'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 40, 41, 42),
        title: Row(
          children: [
            CircleAvatar(backgroundImage: AssetImage('assets/avatar.png')),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Admin', style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white70)),
                Text('Aktif', style: GoogleFonts.poppins(fontSize: 12, color: Colors.white70)),
              ],
            ),
          ],
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final msg = messages[index];
                return Align(
                  alignment: msg['isMe'] ? Alignment.centerRight : Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: msg['isMe'] ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(12),
                        margin: EdgeInsets.symmetric(vertical: 4),
                        decoration: BoxDecoration(
                          color: msg['isMe'] ? const Color.fromARGB(255, 40, 41, 42) : Colors.grey[300],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          msg['message'],
                          style: GoogleFonts.poppins(
                            color: msg['isMe'] ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                      Text(msg['time'], style: GoogleFonts.poppins(fontSize: 10, color: Colors.grey)),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Tulis Pesan',
                      hintStyle: GoogleFonts.poppins(),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
                SizedBox(width: 8),
                CircleAvatar(
                  backgroundColor: const Color.fromARGB(255, 40, 41, 42),
                  child: Icon(Icons.send, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}