// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';

import '../helper/firebase_helper.dart';
import '../helper/helper_function.dart';
import 'main_page.dart';
import 'register_page.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FirebaseAuthentication _firebaseAuthentication =
      FirebaseAuthentication();

  Future<void> _login() async {
    String email = emailController.text;
    String password = passwordController.text;

    try {
      String? user = await _firebaseAuthentication.signInWithEmailPassword(
        email,
        password,
      );
      if (user != null && user != 'INVALID_LOGIN_CREDENTIALS') {
        bool dialogResult = await HelperFunction.showErrorDialog(
            context, "Login Successful", "You've login now. Press OK to move.");
        if (dialogResult) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => MainPage()),
            (route) => false,
          );
        }
      } else {
        bool dialogResult = await HelperFunction.showErrorDialog(
            context, "Login Failed", "Email or password wrong!");
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: Colors.blue, // Warna latar belakang AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Tambahkan gambar atau logo aplikasi di atas judul "Login"
            Image.asset('assets/images/quran.jpg', height: 100),

            const Text(
              'Login',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
            ),
            const SizedBox(height: 20),
            // Gunakan custom TextFormField untuk merancang input field
            CustomInputField(
              controller: emailController,
              labelText: 'Email',
              prefixIcon: Icons.email,
            ),
            const SizedBox(height: 10),
            CustomInputField(
              controller: passwordController,
              labelText: 'Password',
              prefixIcon: Icons.lock,
              isPassword: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _login();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Warna tombol
                padding: const EdgeInsets.symmetric(
                    horizontal: 50, vertical: 15), // Ukuran tombol
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)), // Bentuk tombol
              ),
              child: const Text('Login'),
            ),
            TextButton(
              onPressed: () async {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterPage()),
                  (route) => false,
                );
              },
              child: const Text("Don't have an account? Register"),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomInputField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final IconData prefixIcon;
  final bool isPassword;

  const CustomInputField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.prefixIcon,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: Icon(prefixIcon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
