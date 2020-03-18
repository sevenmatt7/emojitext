import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_emoji/flutter_emoji.dart';

class CardScreen extends StatefulWidget {
  CardScreen({Key key}) : super(key: key);

  @override
  _CardScreenState createState() => new _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  String _message = "I have Aphasia. It makes it hard for me to speak, read or write.\n" +
  "This doesn't mean I don't know what's going on.\n" +
  "I hope you will be patient with me.";

  String _messagetwo = "It is easier for me to communicate through this app.\n" +
  "I hope you will try to understand what I mean and have fun doing it with emojis 🙂";

  String emojiMessage = '';

  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: SafeArea(
        child: ListView(
          children: <Widget> [
            Padding(
              padding: EdgeInsets.only(left: 20.0, right: 120.0, top: 20.0, bottom: 20.0),
              child: Text(
                '👋 Hi, My name is Matthew!',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            
            SizedBox(height: 20.0),

            Center(
              child: Padding(
              padding: EdgeInsets.only(left: 30.0, right: 30.0, top: 20.0, bottom: 20.0),
              child: Text(
                _message,
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ),

            SizedBox(height: 20.0,),

            Center(
              child: Padding(
              padding: EdgeInsets.only(left: 30.0, right: 30.0, top: 20.0, bottom: 20.0),
              child: Text(
                _messagetwo,
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ),
            
            Center(
              child: Padding(
              padding: EdgeInsets.only(left: 30.0, right: 30.0, top: 20.0, bottom: 20.0),
              child: Text(
                '🙇',
                style: TextStyle(
                  fontSize: 60.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ),
            
          ]
        )
      ),
    );
  }
}