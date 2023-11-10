import '../models/candi.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Candi> _filteredCandis = [];
  String _searchQuery = "";
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pencarian Candi")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.deepPurple[50],
              ),
              child: const TextField(
                autofocus: false,
                decoration: InputDecoration(
                    hintText: "Cari Candii",
                    prefixIcon: Icon(Icons.search),
                    border: InputBorder.none,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.purple)),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    )),
              ),
            ),
          ),
          ListView.builder(
            itemCount: _filteredCandis.length,
            itemBuilder: (context, index) {
              final candi = _filteredCandis[index];
              return Card(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 100,
                        height: 100,
                        child:ClipRRect(
                          borderRadius: BorderRadius.circular(10) ,
                          child: [Image.asset(candi.imageAsset,fit: BoxFit.cover,)]))]
                        
                      ),
                    )
                    ],
                  ));
            },
          )
        ],
      ),
    );
  }
}
