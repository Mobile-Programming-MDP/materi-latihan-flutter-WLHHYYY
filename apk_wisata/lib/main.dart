import 'package:apk_wisata/data/candi_data.dart';
// import 'package:apk_wisata/screens/detail_screen.dart';
import 'package:apk_wisata/screens/profile_screen.dart';
import 'package:apk_wisata/screens/search_screen.dart';
import 'package:apk_wisata/screens/sign_in.dart';
import 'package:flutter/material.dart';
import 'packa';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wisata Candi',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true),
      // home : DetailScreen(candi : candiList[0])
      home: SearchScreen(),
      initialRoute: '/',
      routes: {
        //'/homescreen':(context) => const homeScreen(),
        '/signin': (context) => const SignInScreen(),
        '/signup' : (context) => const signup
      },
    );
  }
}
