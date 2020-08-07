// Section 12. Building Flutter Apps - Flutter Fundamentals

import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    return Center(
//      child: Text(
//        "Hello Flutter",
//        textDirection: TextDirection.ltr,
//      ),
//    );

    return Material(
      color: Colors.deepOrange,
      child: Center(
        child: Text(
          "Hello Flutter",
          textDirection: TextDirection.ltr,
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 23.4,
              fontStyle: FontStyle.italic),
        ),
      ),
    );
  }
}
