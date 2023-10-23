import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isSignin = true;
  String fullName = "";
  String userName = "";
  int favoriteCandiCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            color: Colors.deepPurple,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                      padding: const EdgeInsets.only(top: 200 - 50),
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.deepOrange, width: 2),
                                shape: BoxShape.circle),
                            child: CircleAvatar(
                              radius: 50,
                              backgroundImage:
                                  AssetImage('images/placeholder_image.png'),
                            ),
                          ),
                          if (isSignin)
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.camera_alt,
                                  color: Colors.deepPurple,
                                ))
                        ],
                      )),
                )
                //TODO : 2. Buat Bagian Profile Header Yang berisi foto profile

                //TODO : 3. Buat Bagian Profile Header Yang berisi info profile
                //TODO : 4. Buat Bagian Profile Header Yang berisi TextButton Signin/SignOut
              ],
            ),
          ),
        ],
      ),
    );
  }
}
