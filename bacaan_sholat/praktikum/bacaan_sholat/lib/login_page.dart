import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        backgroundColor: Colors.blue, // Warna latar belakang AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Tambahkan gambar atau logo aplikasi di atas judul "Login"
            Image.asset('assets/images/quran.jpg', height: 100),

            Text(
              'Login',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),
            ),
            SizedBox(height: 20),
            // Gunakan custom TextFormField untuk merancang input field
            CustomInputField(
              controller: emailController,
              labelText: 'Email',
              prefixIcon: Icons.email,
            ),
            SizedBox(height: 10),
            CustomInputField(
              controller: passwordController,
              labelText: 'Password',
              prefixIcon: Icons.lock,
              isPassword: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle login logic here
                final email = emailController.text;
                final password = passwordController.text;

                // You can perform user authentication with this data
                // Make API calls or use authentication services here
                Navigator.pushNamed(context, '/mainpage');
              },
              child: Text('Login'),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue, // Warna tombol
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15), // Ukuran tombol
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)), // Bentuk tombol
              ),
            ),
            TextButton(
              onPressed: () {
                // Navigate to the registration page
                Navigator.pushNamed(context, '/');
              },
              child: Text("Don't have an account? Register"),
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

  CustomInputField({
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
