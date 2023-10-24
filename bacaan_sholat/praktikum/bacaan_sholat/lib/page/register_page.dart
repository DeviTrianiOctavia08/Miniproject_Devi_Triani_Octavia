import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Tambahkan gambar atau logo aplikasi di atas judul "Register"
            Image.asset('assets/images/quran.jpg', height: 100),

            Text(
              'Register',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),
            ),
            SizedBox(height: 20),
            // Gunakan custom TextFormField untuk merancang input field
            CustomInputField(
              controller: usernameController,
              labelText: 'Username',
              prefixIcon: Icons.person,
            ),
            SizedBox(height: 10),
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
                // Handle registration logic here
                final username = usernameController.text;
                final email = emailController.text;
                final password = passwordController.text;

                // You can perform user registration with this data
                // Make API calls or use authentication services here

                // Mengarahkan pengguna ke halaman login
                Navigator.pushNamed(context, '/login');
              },
              child: Text('Register'),
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
