import 'package:flutter/material.dart';

//region 66. Flutter Scaffold Widget and Properties
// Takeaway:
// - Use Scaffold as often.
// - Icon button is a generic widget.

class ScaffoldExample extends StatelessWidget {
  void _tapButton() {
    debugPrint("Tapped button");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Scaffold"),
          centerTitle: true, // true: center; false: left
          backgroundColor: Colors.amberAccent.shade700, // specify color + shade
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.email),
                onPressed: () => debugPrint("Email Tapped!")),
            IconButton(icon: Icon(Icons.access_alarm), onPressed: _tapButton)
          ],
        ),
        body: Center(child: Text("Hello again!")));
  }
}
//endregion

//region 64. Formatting our code
// Takeaway:
// - Modularize the codes, put codes into separate DART files.

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //region 62. Creating a Flutter Hello World app
    // Takeaway:
    // Text Widget - must specify text direction.

//    return Center(
//      child: Text(
//        "Hello Flutter",
//        textDirection: TextDirection.ltr,
//      ),
//    );
    //endregion

    //region 63. Understanding Material Design Basics
    // Takeaways:
    // - By enclosing Center within Material widget, we can create
    // beautiful app.

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
    //endregion
  }
}
//endregion
