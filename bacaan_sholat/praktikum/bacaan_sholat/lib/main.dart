// import 'package:bacaan_sholat/page/main_page.dart';
// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: MainPage(),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:bacaan_sholat/page/register_page.dart';
import 'package:bacaan_sholat/login_page.dart';
import 'package:bacaan_sholat/page/main_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/', // Set initial route to the \ Register page
      routes: {
        '/': (context) => RegisterPage(), // Register page
        '/login': (context) => LoginPage(), // Login page
        '/mainpage': (context) =>  MainPage(), // Main page
      },
    );
  }
}
