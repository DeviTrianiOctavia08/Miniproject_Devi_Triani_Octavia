import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../helper/firebase_helper.dart';
import 'ayat_kursi_page.dart';
import 'bacaan_sholat_page.dart';
import 'login_page.dart';
import 'niat_sholat_page.dart';

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
        title: const Text('Aplikasi Bacaan Sholat'),
        backgroundColor: Colors.blue, // Warna AppBar
      ),
      drawer: MyDrawer(),
      body: const Center(
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
  MyDrawer({super.key});
  final FirebaseAuthentication _firebaseAuthentication =
      FirebaseAuthentication();

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
            title: const Text(
              "Niat Sholat",
              style: TextStyle(fontSize: 18, color: Colors.blue), // Warna teks
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const NiatSholat()),
              );
            },
          ),
          ListTile(
            title: const Text(
              "Bacaan Sholat",
              style: TextStyle(fontSize: 18, color: Colors.blue), // Warna teks
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const BacaanSholat()),
              );
            },
          ),
          ListTile(
            title: const Text(
              "Ayat Kursi",
              style: TextStyle(fontSize: 18, color: Colors.blue), // Warna teks
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AyatKursi()),
              );
            },
          ),
          ListTile(
            title: const Text(
              "Logout",
              style: TextStyle(fontSize: 18, color: Colors.blue), // Warna teks
            ),
            onTap: () {
              // kode logout
              FirebaseAuth.instance.signOut();
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
                (route) => false,
              );
            },
          ),
        ],
      ),
    );
  }
}
