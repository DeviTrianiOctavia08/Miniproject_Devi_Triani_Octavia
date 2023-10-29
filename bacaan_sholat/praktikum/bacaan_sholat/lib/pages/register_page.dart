// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../helper/firebase_helper.dart';
import '../helper/helper_function.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final FirebaseAuthentication _firebaseAuthentication =
      FirebaseAuthentication();

  Future<void> _register(BuildContext context) async {
    try {
      String? user = await _firebaseAuthentication.registerWithEmailAndPassword(
        emailController.text,
        passwordController.text,
      );
      if (user == 'weak-password') {
        bool dialogResult = await HelperFunction.showErrorDialog(
            context,
            "Registration Failed",
            "Your password is weak, please insert more than 6 character");
      } else if (user == 'email-already-in-use') {
        bool dialogResult = await HelperFunction.showErrorDialog(
            context,
            "Registration Failed",
            "Your email already registered, please use another email.");
      } else if (user != null) {
        bool dialogResult = await HelperFunction.showErrorDialog(
            context,
            "Registration Successful",
            "You have registered new account. Press OK to move.");
        if (dialogResult) {
          FirebaseAuth.instance.signOut();
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => LoginPage()),
            (route) => false,
          );
        }
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset('assets/images/quran.jpg', height: 100),
                const Text(
                  'Register',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
                const SizedBox(height: 20),
                CustomInputField(
                  controller: usernameController,
                  labelText: 'Username',
                  prefixIcon: Icons.person,
                ),
                const SizedBox(height: 10),
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
                  onPressed: () async {
                    if (usernameController.text.isEmpty ||
                        passwordController.text.isEmpty ||
                        emailController.text.isEmpty) {
                      bool dialogResult = await HelperFunction.showErrorDialog(
                          context,
                          "Registation Failed",
                          "Please fill all data");
                    } else {
                      _register(context);
                    }
                  },
                  child: const Text('Register'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  child: const Text("Already have an account? Login"),
                ),
              ],
            ),
          ),
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
