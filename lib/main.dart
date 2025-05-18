import 'package:flutter/material.dart';
import 'pages/login.dart'; // make sure the path matches your file

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Doomlings',
      theme: ThemeData(
        fontFamily: 'Times New Roman', // optional if using custom font
        scaffoldBackgroundColor: Colors.black,
      ),
      home: LoginPage(), // 👈 THIS shows the login page on launch
    );
  }
}