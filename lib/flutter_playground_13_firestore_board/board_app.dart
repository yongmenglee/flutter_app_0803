// Section 24: Firestore - Realtime Database - Build a Community Board App

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'ui/custom_card.dart';
import 'util/board_util.dart';

class BoardApp extends StatefulWidget {
  @override
  _BoardAppState createState() => _BoardAppState();
}

class _BoardAppState extends State<BoardApp> {
  // Currently it works (20200821)
  var firestoreDb = Firestore.instance.collection("board").snapshots();
  BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Community Board"),
      ),
      body: StreamBuilder(
        stream: firestoreDb,
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());

          this.context = context;
          return ListView.builder(
            itemCount: snapshot.data.documents.length,
            itemBuilder: (context, int index) {
              return CustomCard(
                  snapshot: snapshot.data, index: index, context: context);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Util.showAddDialog(this.context);
        },
        child: Icon(FontAwesomeIcons.pen),
      ),
    );
  }
}
