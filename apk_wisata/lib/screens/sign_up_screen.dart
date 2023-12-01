import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:encrypt/encrypt.dart' as encrypt;

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String _errorText = '';

  bool _obscurePassword = true;

//TODO: 1 Membuat metode _signUp
  void _signUp() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String name = _namaController.text.trim();
    final String username = _userController.text.trim();
    final String password = _passwordController.text.trim();

    if (password.length < 8 ||
        !password.contains(RegExp(r'[A-Z]')) ||
        !password.contains(RegExp(r'[a-z]')) ||
        !password.contains(RegExp(r'[0-9]')) ||
        !password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      setState(() {
        _errorText =
            'Minimal 8 karakter, kombinasi [A-Z], [a-z], [0-9], [!@#\\\$%^&*(),.?":{}|<>]';
      });
      return;
    }

    //Todo: 3. Jika name, username, password tidak kosong lakukan enkripsi
    if(name.isNotEmpty && username.isNotEmpty && password.isNotEmpty){
      final encrypt.Key key = encrypt.Key.fromLength(32);
      final iv = encrypt.IV.fromLength(16);

      final encrypter = encrypt.Encrypter(encrypt.AES(key));
      final encryptedName = encrypter.encrypt(name, iv: iv);
      final encryptedUsername = encrypter.encrypt(username, iv: iv);
      final encryptedPassword = encrypter.encrypt(password, iv: iv);

      //Simpan Data Pengguna di SharedPreferences
      prefs.setString('fulname', encryptedName.base64);
      prefs.setString('username', encryptedUsername.base64); 
      prefs.setString('password', encryptedPassword.base64);
      prefs.setString('key', key.base64);
      prefs.setString('iv', iv.base64);     
    }
    //Simpan Data Pengguna di SharedPreferences
    prefs.setString('fullname', name);
    prefs.setString('username', username);
    prefs.setString('password', password);

    //Buat Navigasi ke SignInScreen
    Navigator.pushReplacementNamed(context, '/signin');

    print('*** Sign Up berhasil!');
    print('Nama: $name');
    print('Nama Pengguna: $username');
    print('Password: $password');
  }

//TODO: 2. Membuat Metode Dispose
  @override
  void dispose() {
    //TODO: implement dispose
    _namaController.dispose();
    _userController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _namaController,
                  textCapitalization: TextCapitalization.words,
                  decoration: const InputDecoration(
                      labelText: "Nama", border: OutlineInputBorder()),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _userController,
                  textCapitalization: TextCapitalization.words,
                  decoration: const InputDecoration(
                      labelText: "Nama Pengguna", border: OutlineInputBorder()),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Kata Sandi',
                    errorText: _errorText.isNotEmpty ? _errorText : null,
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                      icon: Icon(_obscurePassword
                          ? Icons.visibility_off
                          : Icons.visibility),
                    ),
                  ),
                  obscureText: _obscurePassword,
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: _signUp, child: const Text("Sign Up")),
              ],
            )),
          ),
        ),
      ),
    );
  }
}
