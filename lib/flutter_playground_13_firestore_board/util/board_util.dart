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

  static final FocusNode _nameNode = new FocusNode();
  static final FocusNode _titleNode = new FocusNode();
  static final FocusNode _descriptionNode = new FocusNode();

  static BuildContext _context;

  static showAddDialog(BuildContext scaffoldContext) =>
      _showBoardFormDialog(scaffoldContext, UserAction.add);

  static showUpdateDialog(
          BuildContext scaffoldContext, DocumentSnapshot snapshot) =>
      _showBoardFormDialog(scaffoldContext, UserAction.update, snapshot);

  static _showBoardFormDialog(BuildContext scaffoldContext, int userAction,
      [DocumentSnapshot snapshot]) async {
    _context = scaffoldContext;

    String _formTitle = "Add".toUpperCase();
    String _formMessage = "Please fill out the form.";

    switch (userAction) {
      case UserAction.update:
        _formTitle = "Update".toUpperCase();
        _formMessage = "Please fill out the form to update.";
        break;

      default:
        break;
    }

//    await showDialog(
//      context: scaffoldContext,
//      child: AlertDialog(
//        contentPadding: EdgeInsets.all(10.0),
//        actionsOverflowDirection: VerticalDirection.up,
//        title: Text(_formTitle),
//        content: SingleChildScrollView(
//          child: Container(
//            height: 200.0,
////            width: MediaQuery.of(context).size.width,
////            width: 200.0,
//            child: Column(
//              mainAxisAlignment: MainAxisAlignment.center,
//              crossAxisAlignment: CrossAxisAlignment.start,
//              children: [
//                Text(_formMessage),
//                _buildNameTextField(userAction, snapshot),
//                _buildTitleTextField(userAction, snapshot),
//                _buildDescriptionTextField(userAction, snapshot),
//              ],
//            ),
//          ),
//        ),
//        actions: [
//          _buttonOne(scaffoldContext),
//          _buttonTwo(scaffoldContext, userAction, snapshot),
//        ],
//      ),
//    );
    await showDialog(
        context: scaffoldContext,
        builder: (context) {
          return StatefulBuilder(
            builder: (context, setState) {
              return AlertDialog(
                contentPadding: EdgeInsets.all(10.0),
                actionsOverflowDirection: VerticalDirection.up,
                title: Text(_formTitle),
                content: SingleChildScrollView(
                  child: Container(
                    height: 200.0,
//            width: MediaQuery.of(context).size.width,
//            width: 200.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(_formMessage),
                        _buildNameTextField(
                            userAction, context, snapshot, setState),
                        _buildTitleTextField(
                            userAction, context, snapshot, setState),
                        _buildDescriptionTextField(
                            userAction, context, snapshot, setState),
                      ],
                    ),
                  ),
                ),
                actions: [
                  _buttonOne(scaffoldContext),
                  _buttonTwo(scaffoldContext, userAction, snapshot),
                ],
              );
            },
          );
        });
  }
  // endregion

  // region Text fields
  static Widget _buildNameTextField(int action, BuildContext context,
          DocumentSnapshot snapshot, Function(Function()) setState) =>
      _buildTextField(Fields.name, action, context, snapshot, setState);

  static Widget _buildTitleTextField(int action, BuildContext context,
          DocumentSnapshot snapshot, Function(Function()) setState) =>
      _buildTextField(Fields.title, action, context, snapshot, setState);

  static Widget _buildDescriptionTextField(int action, BuildContext context,
          DocumentSnapshot snapshot, Function(Function()) setState) =>
      _buildTextField(Fields.description, action, context, snapshot, setState);

  static Expanded _buildTextField(
      String field,
      int userAction,
      BuildContext context,
      DocumentSnapshot snapshot,
      Function(Function()) setState) {
    String _textFieldLabel;
//    String _textFieldError;
    TextEditingController _selectedController;
    FocusNode _currentNode;
    FocusNode _nextNode;
    TextInputAction _textInputAction = TextInputAction.next;
//    bool _textFieldIsEmpty = false;

    switch (field) {
      case Fields.name:
        _textFieldLabel = "Your Name*";
//        _textFieldError = "Please enter your name.";
        _selectedController = _nameInputController;
        _selectedController.text = (userAction == UserAction.update)
            ? denullify(snapshot.data[Fields.name])
            : "";
        _currentNode = _nameNode;
        _nextNode = _titleNode;
        break;

      case Fields.title:
        _textFieldLabel = "Title*";
//        _textFieldError = "Please enter title.";
        _selectedController = _titleInputController;
        _selectedController.text = (userAction == UserAction.update)
            ? denullify(snapshot.data[Fields.title])
            : "";
        _currentNode = _titleNode;
        _nextNode = _descriptionNode;
        break;

      case Fields.description:
        _textFieldLabel = "Description*";
//        _textFieldError = "Please enter description.";
        _selectedController = _descriptionInputController;
        _selectedController.text = (userAction == UserAction.update)
            ? denullify(snapshot.data[Fields.description])
            : "";
        _currentNode = _descriptionNode;
        _textInputAction = TextInputAction.done;
        break;

      default:
        break;
    }

    return Expanded(
      child: TextField(
        controller: _selectedController,
        focusNode: _currentNode,
        keyboardType: TextInputType.text,
        textInputAction: _textInputAction,
        autofocus: (_currentNode == _nameNode),
        autocorrect: true,
        decoration: InputDecoration(
          labelText: _textFieldLabel,
//          errorText: _textFieldIsEmpty ? _textFieldError : null,
        ),
        onSubmitted: (value) {
//          setState(() {
//            _selectedController.text = value;
//            _textFieldIsEmpty = (value == null || value == "");
//          });
//          if (value.isEmpty) {
//            _textFieldIsEmpty = true;
//          }
          _currentNode.unfocus();
          if (_nextNode != null) {
            _nextNode.requestFocus();
          }
        },
      ),
    );
  }
  // endregion

  // region Action buttons
  static FlatButton _buttonOne(BuildContext scaffoldContext) =>
      _buildActionButton(scaffoldContext, UserAction.cancel);

  static FlatButton _buttonTwo(BuildContext scaffoldContext, int userAction,
          [DocumentSnapshot snapshot]) =>
      _buildActionButton(scaffoldContext, userAction, snapshot);

  static FlatButton _buildActionButton(BuildContext scaffoldContext, int action,
      [DocumentSnapshot snapshot]) {
    Function() _buttonAction;
    String _buttonLabel;

    switch (action) {
      case UserAction.cancel:
        _buttonAction = _dismissDialogBox;
        _buttonLabel = "Cancel";
        break;

      case UserAction.add:
        _buttonAction = () {
          addRecord(scaffoldContext);
        };
        _buttonLabel = "Save";
        break;

      case UserAction.update:
        _buttonAction = () {
          updateRecord(scaffoldContext, snapshot.documentID);
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
}


class BoardTextField extends StatefulWidget {
  @override
  _BoardTextFieldState createState() => _BoardTextFieldState();
}

class _BoardTextFieldState extends State<BoardTextField> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


String denullify(dynamic val) {
  if (val == null) return "-";
  if (val is String) return val;
  return val.toString();
}
