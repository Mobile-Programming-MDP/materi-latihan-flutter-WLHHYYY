import 'package:flutter/gestures.dart';
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
        child: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
              child: Column(
            //TODO 4. atur mainAxisAlignment dan crossAxisAlignment
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //TODO: 5. Pasang TextFormField Nama pengguna
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: "Nama Pengguna",
                  border: OutlineInputBorder(),
                ),
              ),
              //Todo: 6. Pasang TextFormField kata sandi
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                    labelText: "Kata Sandi",
                    errorText: _errorText.isNotEmpty ? _errorText : null,
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                    )),
                obscureText: _obscurePassword,
              ),
              //TODO: 7. Pasang elevatorButton Sign in
              SizedBox(
                height: 20,
              ),
              ElevatedButton(onPressed: () {}, child: Text("Sign In")),
              //todo: 8.pASANG tEXTbUTTON sIGN uP
              SizedBox(
                height: 10,
              ),
              // TextButton(onPressed: (){}, child: Text('Belum Punya AKun? Daftar Di sini'))
              RichText(
                text: TextSpan(
                    text: "Belum Punya Akun ? ",
                    style: TextStyle(fontSize: 16, color: Colors.deepPurple),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Daftar di sini',
                        style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                            fontSize: 16),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushNamed(context, '/signup');
                          },
                      )
                    ]),
              )
            ],
          )),
        )),
      ),
    );
  }
}
