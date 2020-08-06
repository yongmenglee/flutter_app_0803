import 'package:flutter/material.dart';

//region 66. Flutter Scaffold Widget and Properties

class BottomNavButton {
  Icon _btnIcon;
  Text _btnTitle;

  BottomNavButton.create(this._btnIcon, this._btnTitle);
}

enum BottomNavigation { HOME, MY_NETWORK, POST, NOTIFICATIONS, JOBS }

class ScaffoldExample extends StatelessWidget {

//class ScaffoldExample extends StatelessWidget {
  void _tapButton() {
    debugPrint("Tapped button");
  }

  final _mapBottomNavButton = {
    "Home": Icons.home,
    "My Network": Icons.people_outline,
    "Post": Icons.add_circle_outline,
    "Notifications": Icons.notifications_none,
    "Jobs": Icons.work
  };

  final _titleStyleBottomNavButton = new TextStyle(fontSize: 10);

  List<BottomNavigationBarItem> listBtnBottomNavigation() {
    var list = new List<BottomNavigationBarItem>();

    _mapBottomNavButton.forEach((title, icon) {
      list.add(BottomNavigationBarItem(
          icon: Icon(icon),
          title: Text(title, style: _titleStyleBottomNavButton)));
    });
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scaffold"),
        centerTitle: false, // true: center; false: left
        backgroundColor: Colors.amberAccent.shade700, // specify color + shade
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () => debugPrint("Add button tapped!")),
          IconButton(icon: Icon(Icons.search), onPressed: _tapButton)
        ],
      ),
      //region 70. Floating Action button
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        child: Icon(Icons.add_a_photo),
        onPressed: () => debugPrint("Hello"),
      ),
      //endregion
      //region 69. BottomNavBar
      // Max 3 button on bottom nav bar (both horizontal & vertical).
      bottomNavigationBar: BottomNavigationBar(
        items: listBtnBottomNavigation(), 
        onTap: (int index) => debugPrint("Tapped item: $index"),
        type: BottomNavigationBarType.fixed,
      ),
      //endregion
      backgroundColor: Colors.grey.shade300,

      //region 67. InkWell widget
//        body: Center(child: Text("Hello Again!"))
      body: Container(
          alignment: Alignment.center,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CustomButton(),
//                InkWell(
//                  child: Text("Tap me!", style: TextStyle(fontSize: 23.5)),
//                  onTap: () => debugPrint("Tapped..."),
//                )
              ])),
      //endregion
    );
  }

//  void setState(Null Function() param0) {}
}
//endregion

//region 68. Gesture Detector widget
class CustomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          final snackBar = SnackBar(
            content: Text("Hello Again"),
            backgroundColor: Colors.amberAccent.shade400,
          );
          Scaffold.of(context).showSnackBar(snackBar);
        },
        child: Container(
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: Colors.pinkAccent,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Text("Button"),
        ));
  }
}

//endregion

//region 64. Formatting our code

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //region 62. Creating a Flutter Hello World app
//    return Center(
//      child: Text(
//        "Hello Flutter",
//        textDirection: TextDirection.ltr,
//      ),
//    );
    //endregion

    //region 63. Understanding Material Design Basics
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
