// Section 13. Build a Biz Card App

import 'package:flutter/material.dart';

TextStyle _txtStyleBizCard = new TextStyle(
  color: Colors.black,
  fontSize: 14.0,
);

class ContactInfo {
  String _contactType, _contactDetails;
  IconData _contactIconData = Icons.perm_identity;

  set setContactIconData(IconData value) => this._contactIconData = value;

  ContactInfo(this._contactType, this._contactDetails);

  Row buildRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Icon(_contactIconData),
        Text("$_contactType: $_contactDetails", style: _txtStyleBizCard)
      ],
    );
  }
}

class ScaffoldBizCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("BizCard"),
          backgroundColor: Colors.deepPurple.shade900,
        ),
//        backgroundColor: Colors.deepPurple.shade600.withGreen(70),
        backgroundColor: Colors.deepPurple.shade600,
        body: Container(
          alignment: Alignment.center,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              _getCard(),
              _getAvatar(),
            ],
          ),
        ));
  }

  Container _getCard() {
    Text _txtBizCardName(String name) => new Text(
          name,
          style: TextStyle(
            color: Colors.white,
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
        );

    Text _txtBizCardWebsite(String website) =>
        new Text(website, style: _txtStyleBizCard);

    final _listRowContacts = [
      ContactInfo("Email", "minho@gmail.com").buildRow(),
//    ContactInfo("LinkedIn", "@minhol").buildRow(),
//    ContactInfo("Telegram", "@minhol").buildRow(),
//    ContactInfo("GitHub", "@minhol").buildRow()
    ];

    final _rowVertSpace =
        Container(padding: EdgeInsets.symmetric(vertical: 2.0));

    return Container(
      width: 300,
      height: 180,
      margin: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(100),
        borderRadius: BorderRadius.circular(4.5),
      ),
      padding: EdgeInsets.fromLTRB(30.0, 20.0, 0.0, 0.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
              _txtBizCardName("Minho Lee"),
              _rowVertSpace,
              _txtBizCardWebsite("www.minho.com"),
              _rowVertSpace
            ] +
            _listRowContacts,
      ),
    );
  }

  Container _getAvatar() {
    return Container(
      width: 80,
      height: 80,
      margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 190.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(50.0)),
        border: Border.all(
          color: Colors.deepPurple,
          width: 1.2,
        ),
        image: DecorationImage(
            image: NetworkImage(
                "https://picsum.photos/200"), // random pictures from picsum.com
            fit: BoxFit.cover),
      ),
    );
  }
}
