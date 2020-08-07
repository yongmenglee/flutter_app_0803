// Section 12. Building Flutter Apps - Flutter Fundamentals

import 'package:flutter/material.dart';
import 'custom_button.dart';

enum BottomNavigation { HOME, MY_NETWORK, POST, NOTIFICATIONS, JOBS }

class ScaffoldExample extends StatelessWidget {
  final _mapBottomNavButton = {
    "Home": Icons.home,
    "My Network": Icons.people_outline,
    "Post": Icons.add_circle_outline,
    "Notifications": Icons.notifications_none,
    "Jobs": Icons.work
  };

  final _titleStyleBottomNavButton = new TextStyle(fontSize: 12);

  List<BottomNavigationBarItem> listBtnBottomNavigation() {
    var list = new List<BottomNavigationBarItem>();

    _mapBottomNavButton.forEach((title, icon) {
      list.add(BottomNavigationBarItem(
          icon: Icon(icon),
          title: Text(title, style: _titleStyleBottomNavButton)));
    });
    return list;
  }

  List<String> _listTitleBottomNavBtn() => _mapBottomNavButton.keys.toList();

  void _tapButton() => debugPrint("Tapped button");

  @override
  Widget build(BuildContext context) {
    Future<void> _showMyDialogBottomNav(int index) async {
      var _listTitle = _listTitleBottomNavBtn()[index];
      var _txtAlertTitle = "$_listTitle Tapped!";
      var _listAlertMessages = [
        Text('You\'ve tapped $_listTitle! 🤩'),
        Text('Please approve to close this alert dialog.'),
      ];

      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return buildAlertDialog(_txtAlertTitle, _listAlertMessages, context);
        },
      );
    }

    return Scaffold(
        appBar: AppBar(
          title: Text("Scaffold"),
          centerTitle: false, // true: center; false: left
          backgroundColor: Colors.amberAccent.shade700, // specify color + shade
          leading: IconButton(
            icon: Icon(Icons.list),
            onPressed: () => debugPrint("Show menu."),
          ),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.add),
                onPressed: () => debugPrint("Add button tapped!")),
            IconButton(icon: Icon(Icons.search), onPressed: _tapButton)
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.lightBlueAccent,
          child: Icon(Icons.add_a_photo),
          onPressed: () => debugPrint("Hello"),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: listBtnBottomNavigation(),
          onTap: _showMyDialogBottomNav, // parameter: (int)
          type: BottomNavigationBarType.fixed, // set >3 buttons
        ),
        backgroundColor: Colors.grey.shade300,

//        body: Center(child: Text("Hello Again!"))
        body: Container(
            alignment: Alignment.center,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CustomButton("New Button"),
                  Container(padding: EdgeInsets.all(10.0)),
                  CustomButton("New Button 2"),
                  Container(padding: EdgeInsets.all(10.0)),
                  InkWell(
                    child: Text("Tap me!", style: TextStyle(fontSize: 23.5)),
                    onTap: () => debugPrint("Tapped..."),
                  )
                ])));
  }

  AlertDialog buildAlertDialog(
      String title, List<Widget> listMessage, BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: SingleChildScrollView(
        child: ListBody(
          children: listMessage,
        ),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text('Approve'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
