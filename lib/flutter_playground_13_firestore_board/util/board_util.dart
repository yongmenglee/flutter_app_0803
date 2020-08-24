// Section 24: Firestore - Realtime Database - Build a Community Board App

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp0803/flutter_playground_13_firestore_board/ui/board_alert_confirm_delete.dart';
import 'package:flutterapp0803/flutter_playground_13_firestore_board/ui/board_alert_dialog.dart';

class Fields {
  static const String name = "name";
  static const String title = "title";
  static const String description = "description";
  static const String timestamp = "timestamp";
}

class UserAction {
  static const int delete = -1;
  static const int cancel = 0;
  static const int add = 1;
  static const int update = 2;
}

class Util {
  static Map<String, dynamic> record = {
    Fields.name: "",
    Fields.title: "",
    Fields.description: "",
  };

  static BuildContext _context;

  // region Alert Dialog
  static showAddDialog(BuildContext scaffoldContext) =>
      _showBoardFormDialog(scaffoldContext, UserAction.add);

  static showUpdateDialog(
          BuildContext scaffoldContext, DocumentSnapshot snapshot) =>
      _showBoardFormDialog(scaffoldContext, UserAction.update, snapshot);

  static _showBoardFormDialog(BuildContext scaffoldContext, int userAction,
      [DocumentSnapshot snapshot]) async {
    _context = scaffoldContext;

    await showDialog(
      context: scaffoldContext,
      child: BoardAlertDialog(
          scaffoldContext: scaffoldContext,
          snapshot: snapshot,
          userAction: userAction),
    );
  }

  static showConfirmDeleteDialog(
      BuildContext scaffoldContext, DocumentSnapshot snapshot) async {
    _context = scaffoldContext;

    await showDialog(
      context: scaffoldContext,
      child: BoardAlertConfirmDelete(
          scaffoldContext: scaffoldContext, snapshot: snapshot),
    );
  }

  static void dismissDialogBox() {
    record = {};
    Navigator.pop(_context);
  }

  // end region

  // region Database
  static void addRecord(BuildContext context) =>
      _updateDb(context, UserAction.add);

  static void updateRecord(BuildContext context, String docId) =>
      _updateDb(context, UserAction.update, docId);

  static void deleteRecord(BuildContext context, String docId) =>
      _updateDb(context, UserAction.delete, docId);

  static void _updateDb(BuildContext context, int userAction, [String docId]) {
    String valName = record[Fields.name] ?? "";
    String valTitle = record[Fields.title] ?? "";
    String valDesc = record[Fields.description] ?? "";

    // Validate user input (not empty)
    if ((valName.isEmpty || valTitle.isEmpty || valDesc.isEmpty) &&
        (userAction != UserAction.delete)) return;

    record[Fields.timestamp] = new DateTime.now();

    switch (userAction) {
      case UserAction.add:
        Firestore.instance
            .collection("board") // Name of the collection
            .add(record) // Add Map object to the collection
            .then((response) {
          // Expect Future response
          print("New record saved: ${response.documentID}");
          showUpdateDbSnackBar(context, userAction);
          dismissDialogBox();
        }).catchError((error) => print(error));
        break;

      case UserAction.update:
        Firestore.instance
            .collection("board")
            .document(docId)
            .updateData(record)
            .then((response) {
          print("Record updated: $docId");
          showUpdateDbSnackBar(context, userAction);
          dismissDialogBox();
        }).catchError((error) => print(error));
        break;

      case UserAction.delete:
        Firestore.instance
            .collection("board")
            .document(docId)
            .delete()
            .then((response) {
          print("Record deleted: $docId");
          showUpdateDbSnackBar(context, userAction);
          dismissDialogBox();
        }).catchError((error) => print(error));
        break;

      default:
        break;
    }
  }
  // endregion

  static void showUpdateDbSnackBar(BuildContext context, int userAction) {
    String snackBarMessage;
    Color snackBarColor;

    switch (userAction) {
      case UserAction.add:
        snackBarMessage = "New record added successfully.";
        snackBarColor = Colors.green;
        break;

      case UserAction.update:
        snackBarMessage = "Record updated successfully.";
        snackBarColor = Colors.yellow.shade800;
        break;

      case UserAction.delete:
        snackBarMessage = "Record deleted successfully.";
        snackBarColor = Colors.red;
        break;

      default:
        break;
    }

    SnackBar snackBar = new SnackBar(
      content: Text(snackBarMessage),
      duration: Duration(seconds: 4),
      backgroundColor: snackBarColor,
    );

    Scaffold.of(context).showSnackBar(snackBar);
  }

  static checkNetwork(BuildContext context) async {
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('connected');
      }
    } on SocketException catch (_) {
      print('not connected');

      SnackBar snackBar = new SnackBar(
        content: Text("No network connection"),
        duration: Duration(seconds: 4),
      );

      Scaffold.of(context).showSnackBar(snackBar);
    }
  }
}

String denullify(dynamic val) {
  if (val == null) return "-";
  if (val is String) return val;
  return val.toString();
}
