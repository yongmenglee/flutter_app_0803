// Section 12. Building Flutter Apps - Flutter Fundamentals

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final _txtTitle;

  CustomButton(this._txtTitle);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          final snackBar = SnackBar(
            content: Text("${this._txtTitle} tapped! 😀",
                textAlign: TextAlign.center),
            backgroundColor: Colors.black12.withOpacity(0.7),
            duration: Duration(milliseconds: 1500),
          );
          Scaffold.of(context).showSnackBar(snackBar);
        },
        child: Container(
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: Colors.pinkAccent.shade100,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Text(this._txtTitle),
        ));
  }
}