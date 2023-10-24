import 'package:flutter/material.dart';
import 'package:bacaan_sholat/page/ayat_kursi_page.dart';
import 'package:bacaan_sholat/page/bacaan_sholat_page.dart';
import 'package:bacaan_sholat/page/niat_sholat_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue, // Warna latar belakang
      appBar: AppBar(
        title: Text('Aplikasi Bacaan Sholat'),
        backgroundColor: Colors.blue, // Warna AppBar
      ),
      drawer: MyDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Selamat datang di Aplikasi Bacaan Sholat',
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
            // Tambahkan gambar atau elemen desain lainnya jika diperlukan
          ],
        ),
      ),
    );
  }
}

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue, // Warna latar belakang DrawerHeader
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Assalamu'alaikum",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            title: Text(
              "Niat Sholat",
              style: TextStyle(fontSize: 18, color: Colors.blue), // Warna teks
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NiatSholat()),
              );
            },
          ),
          ListTile(
            title: Text(
              "Bacaan Sholat",
              style: TextStyle(fontSize: 18, color: Colors.blue), // Warna teks
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BacaanSholat()),
              );
            },
          ),
          ListTile(
            title: Text(
              "Ayat Kursi",
              style: TextStyle(fontSize: 18, color: Colors.blue), // Warna teks
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AyatKursi()),
              );
            },
          ),
        ],
      ),
    );
  }
}
