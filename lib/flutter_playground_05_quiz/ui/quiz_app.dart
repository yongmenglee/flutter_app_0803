// Section 16. APP - Quiz App - Learn More Flutter Widgets

import 'package:flutter/material.dart';

class QuizApp extends StatefulWidget {
  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("True Citizen"),
          centerTitle: true,
          backgroundColor: Colors.blueGrey,
        ),
        backgroundColor: Colors.blueGrey,
        body: Container(
          child: Column(
            children: <Widget>[
              Image.asset(
                "images/flag.png",
                width: 250,
                height: 180,
              ),
            ],
          ),
        ));
  }
}
