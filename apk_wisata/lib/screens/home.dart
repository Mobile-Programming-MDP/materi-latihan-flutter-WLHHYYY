import 'package:flutter/material.dart';
import 'package:apk_wisata/data/candi_data.dart';
import 'package:apk_wisata/screens/item_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //TODO: 1. Buat appbar dengan judul Wisata Candi
      appBar: AppBar(
        title: Text('Wisata Candi'),
      ),
      //TODO: 2. Buat body dengan GridView.builder
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          padding: EdgeInsets.all(8),
          itemCount: candiList.length,
          itemBuilder: (context, index) {
            return ItemCard(candi: candiList[index]);
          }),
      //TODO: 3. Buat ItemCard sebagai return value dari GridView.builder
    );
  }
}
