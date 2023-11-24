import 'package:flutter/material.dart';
import 'package:apk_wisata/models/candi.dart';
import 'package:apk_wisata/screens/detail_screen.dart';

class ItemCard extends StatelessWidget {
  //TODO: 1 Deklarasikan variabel yang dibutuhkan dan pasang pada konstruktor
  final Candi candi;
  ItemCard({required this.candi});

  @override
  Widget build(BuildContext context) {
    //TODO: 6 Implementasi routing ke DetailScreen
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(candi: candi),
          ),
        );
      },
      child: Card(
        //TODO: 2 Tetapkan parameter shape, margin, dan elevation dari cari
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        margin: EdgeInsets.all(4),
        elevation: 1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //TODO: 3 Buat Image sebagai anak dari column
            Expanded(
              //TODO: 7 Implementasi Hero Animation
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  candi.imageAsset,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            //TODO: 4 Buat Text sebagai anak dari column
            Padding(
              padding: EdgeInsets.only(left: 16, top: 8),
              child: Text(
                candi.name,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            //TODO: 5 Buat Text sebagai anak dari column
            Padding(
              padding: EdgeInsets.only(left: 16, top: 8),
              child: Text(
                candi.type,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
