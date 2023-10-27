import 'package:flutter/material.dart';

class SignInScrenn extends StatelessWidget {
  SignInScrenn({super.key});

  //TODO DEKLARASI VARIABEL
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String _errorText = '';
  bool _isSignIn = false;
  bool _obscurePassword = true;

  Widget build(BuildContext context) {
    return Scaffold(
      //TODO 2. Pasang AppBar
      appBar: AppBar(title: Text('Sign In')),
      //TODO: 3. Pasang Body
      body: Center(
        child: Form(child: Column()),
      ),
    );
  }
}
