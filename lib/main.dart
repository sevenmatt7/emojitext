import 'package:dsc_hackathon/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Emojify',
      home: new HomeScreen(),
      debugShowCheckedModeBanner: false
    );
  }
}
