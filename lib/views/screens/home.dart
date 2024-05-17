import 'package:flutter/material.dart';
import 'package:meme_app/constants/constants.dart';
import 'package:meme_app/views/login/login.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightGreen,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(
          "Memes",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      drawer: Drawer(
        backgroundColor: lightGreen,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.teal,
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(
                        "https://img.freepik.com/premium-photo/captivating-cartoon-characters-cute-kids-playful-boys-lovely-girls-digital-world_1142283-14301.jpg"),
                  ),
                  Text(
                    'Sumit Dhamala',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text('Settings'),
              onTap: () {},
            ),
            ListTile(
              title: Text('Logout'),
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: FlutterLogo(
              size: 100,
            ),
          ),
        ],
      ),
    );
  }
}
