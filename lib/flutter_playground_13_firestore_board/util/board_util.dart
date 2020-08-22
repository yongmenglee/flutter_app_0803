// Section 24: Firestore - Realtime Database - Build a Community Board App

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


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
  // region Alert dialog
  static TextEditingController _nameInputController =
      new TextEditingController();
  static TextEditingController _titleInputController =
      new TextEditingController();
  static TextEditingController _descriptionInputController =
      new TextEditingController();

  static BuildContext _context;

  static showAddDialog(BuildContext context) =>
      _showBoardFormDialog(context, UserAction.add);

  static showUpdateDialog(BuildContext context, DocumentSnapshot snapshot) =>
      _showBoardFormDialog(context, UserAction.update, snapshot);

  static _showBoardFormDialog(BuildContext context, int userAction,
      [DocumentSnapshot snapshot]) async {
    _context = context;

    String _formTitle = "Please fill out the form.";
    String _buttonTwoLabel = "Save".toUpperCase();

    switch (userAction) {
      case UserAction.update:
        _formTitle = "Please fill out the form to update.";
        _buttonTwoLabel = "Update".toUpperCase();
        break;

      default:
        break;
    }

    await showDialog(
      context: context,
      child: AlertDialog(
        contentPadding: EdgeInsets.all(10.0),
        content: Container(
          height: 200.0,
          child: Column(
            children: [
              Text(_formTitle),
              _buildNameTextField(userAction, snapshot),
              _buildTitleTextField(userAction, snapshot),
              _buildDescriptionTextField(userAction, snapshot),
            ],
          ),
        ),
        actions: [
          _buttonOne(context),
          _buttonTwo(context, userAction, snapshot),
        ],
      ),
    );
  }
  // endregion

  // region Text fields
  static Widget _buildNameTextField(int action, DocumentSnapshot snapshot) =>
      _buildTextField(Fields.name, action, snapshot);

  static Widget _buildTitleTextField(int action, DocumentSnapshot snapshot) =>
      _buildTextField(Fields.title, action, snapshot);

  static Widget _buildDescriptionTextField(
          int action, DocumentSnapshot snapshot) =>
      _buildTextField(Fields.description, action, snapshot);

  static Expanded _buildTextField(
      String field, int userAction, DocumentSnapshot snapshot) {
    String _textFieldLabel;
    TextEditingController _selectedController;

    switch (field) {
      case Fields.name:
        _textFieldLabel = "Your Name*";
        _selectedController = _nameInputController;
        _selectedController.text = (userAction == UserAction.update)
            ? denullify(snapshot.data[Fields.name])
            : "";
        break;

      case Fields.title:
        _textFieldLabel = "Title*";
        _selectedController = _titleInputController;
        _selectedController.text = (userAction == UserAction.update)
            ? denullify(snapshot.data[Fields.title])
            : "";
        break;

      case Fields.description:
        _textFieldLabel = "Description*";
        _selectedController = _descriptionInputController;
        _selectedController.text = (userAction == UserAction.update)
            ? denullify(snapshot.data[Fields.description])
            : "";
        break;

      default:
        break;
    }

    return Expanded(
      child: TextField(
        autofocus: true,
        autocorrect: true,
        decoration: InputDecoration(labelText: _textFieldLabel),
        controller: _selectedController,
      ),
    );
  }
  // endregion

  // region Action buttons
  static FlatButton _buttonOne(BuildContext context) =>
      _buildActionButton(context, UserAction.cancel);

  static FlatButton _buttonTwo(BuildContext context, int userAction,
          [DocumentSnapshot snapshot]) =>
      _buildActionButton(context, userAction, snapshot);

  static FlatButton _buildActionButton(BuildContext context, int action,
      [DocumentSnapshot snapshot]) {
    Function() _buttonAction;
    String _buttonLabel;

    switch (action) {
      case UserAction.cancel:
        _buttonAction = _dismissDialogBox;
        _buttonLabel = "Cancel";
        break;

      case UserAction.add:
//        _buttonAction = addRecord;
        _buttonAction = () {
          addRecord(context);
        };
        _buttonLabel = "Save";
        break;

      case UserAction.update:
        _buttonAction = () {
          updateRecord(context, snapshot.documentID);
        };
        _buttonLabel = "Update";
        break;

      default:
        break;
    }

    return FlatButton(
      onPressed: _buttonAction,
      child: Text(_buttonLabel.toUpperCase()),
    );
  }

  static void _dismissDialogBox() {
    // Clear text on text field.
    _nameInputController.clear();
    _titleInputController.clear();
    _descriptionInputController.clear();

    // Pop the dialog box.
    Navigator.pop(_context);
  }

  static void addRecord(BuildContext context) =>
      _updateDb(context, UserAction.add);

  static void updateRecord(BuildContext context, String docId) =>
      _updateDb(context, UserAction.update, docId);

  static void deleteRecord(BuildContext context, String docId) =>
      _updateDb(context, UserAction.delete, docId);

  static void _updateDb(BuildContext context, int userAction, [String docId]) {
    String valName = _nameInputController.text;
    String valTitle = _titleInputController.text;
    String valDesc = _descriptionInputController.text;
    Map<String, dynamic> data;

    // Validate user input (not empty)
    if (valName.isNotEmpty && valTitle.isNotEmpty && valDesc.isNotEmpty) {
      data = {
        Fields.name: valName,
        Fields.title: valTitle,
        Fields.description: valDesc,
        Fields.timestamp: new DateTime.now()
      };
    }

    if (data == null && userAction != UserAction.delete) return;

    switch (userAction) {
      case UserAction.add:
        Firestore.instance
            .collection("board") // Name of the collection
            .add(data) // Add Map object to the collection
            .then((response) {
          // Expect Future response
          print("New record saved: ${response.documentID}");
          showUpdateDbSnackBar(context, userAction);
          _dismissDialogBox();
        }).catchError((error) => print(error));
        break;

      case UserAction.update:
        Firestore.instance
            .collection("board")
            .document(docId)
            .updateData(data)
            .then((response) {
          print("Record updated: $docId");
          showUpdateDbSnackBar(context, userAction);
          _dismissDialogBox();
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

    switch(userAction) {
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
}

String denullify(dynamic val) {
  if (val == null) return "-";
  if (val is String) return val;
  return val.toString();
}
