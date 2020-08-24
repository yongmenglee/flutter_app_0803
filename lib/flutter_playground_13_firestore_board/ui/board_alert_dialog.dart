import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterapp0803/flutter_playground_13_firestore_board/ui/board_text_field.dart';
import 'package:flutterapp0803/flutter_playground_13_firestore_board/util/board_util.dart';

class BoardAlertDialog extends StatefulWidget {
  final BuildContext scaffoldContext;
  final DocumentSnapshot snapshot;
  final int userAction;

  const BoardAlertDialog(
      {Key key, this.scaffoldContext, this.snapshot, this.userAction})
      : super(key: key);

  @override
  _BoardAlertDialogState createState() => _BoardAlertDialogState(
      scaffoldContext: scaffoldContext,
      snapshot: snapshot,
      userAction: userAction);
}

class _BoardAlertDialogState extends State<BoardAlertDialog> {
  final BuildContext scaffoldContext;
  final DocumentSnapshot snapshot;
  final int userAction;

  // region Alert dialog
  TextEditingController _nameInputController = new TextEditingController();
  TextEditingController _titleInputController = new TextEditingController();
  TextEditingController _descriptionInputController =
      new TextEditingController();

  final FocusNode _nameNode = new FocusNode();
  final FocusNode _titleNode = new FocusNode();
  final FocusNode _descriptionNode = new FocusNode();

  _BoardAlertDialogState(
      {this.scaffoldContext, this.snapshot, this.userAction});

  @override
  Widget build(BuildContext context) {
    _nameInputController.text = _setFieldDefaultText(Fields.name);
    _titleInputController.text = _setFieldDefaultText(Fields.title);
    _descriptionInputController.text = _setFieldDefaultText(Fields.description);

    return AlertDialog(
      contentPadding: EdgeInsets.all(10.0),
      actionsOverflowDirection: VerticalDirection.up,
      title: Text("Test"),
      content: SingleChildScrollView(
        child: Container(
          height: 240.0,
//            width: MediaQuery.of(context).size.width,
//            width: 200.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("_formMessage"),
//              _buildNameTextField(userAction, context, snapshot, setState),
              BoardTextField(
                  scaffoldContext: scaffoldContext,
                  snapshot: snapshot,
                  field: Fields.name,
                  userAction: userAction,
                  controller: _nameInputController,
                  currentNode: _nameNode,
                  nextNode: _titleNode),
              _buildTitleTextField(userAction, context, snapshot, setState),
              _buildDescriptionTextField(
                  userAction, context, snapshot, setState),

//              BoardTextField(scaffoldContext: scaffoldContext, snapshot: snapshot, controller: _nameInputController, currentNode: _nameNode, nextNode: _titleNode),
//              Expanded(
//                child: TextField(
//                  controller: _nameInputController,
//                  focusNode: _nameNode,
//                  keyboardType: TextInputType.text,
//                  textInputAction: TextInputAction.next,
//                  autofocus: true,
//                  autocorrect: true,
//                  decoration: InputDecoration(
//                    labelText: "Test",
//                    errorText: _textFieldIsEmpty ? "Empty!" : null,
//                  ),
//                  onSubmitted: (value) {
////                setState(() {
//////                  _selectedController.text = value;
////                  _textFieldIsEmpty = (value == null || value == "");
////                });
//
//                    _textFieldIsEmpty = (value == null || value == "");
//                    _nameNode.unfocus();
//                    if (_titleNode != null) {
//                      _titleNode.requestFocus();
//                    }
//                  },
//                ),
//              ),

            ],
          ),
        ),
      ),
      actions: [
        FlatButton(
          child: Text("Test button"),
        )
//        _buttonOne(scaffoldContext),
//        _buttonTwo(scaffoldContext, userAction, snapshot),
      ],
    );
  }

  String _setFieldDefaultText(String field) {
    if (userAction != UserAction.update) return "";

    switch (field) {
      case Fields.name:
        return denullify(snapshot.data[Fields.name]);
      case Fields.title:
        return denullify(snapshot.data[Fields.title]);
      case Fields.description:
        return denullify(snapshot.data[Fields.description]);
      default:
        return "";
    }
  }

//  Widget _buildNameTextFieldTest()

  Widget _buildNameTextField(int action, BuildContext context,
          DocumentSnapshot snapshot, Function(Function()) setState) =>
      _buildTextField(Fields.name, action, context, snapshot, setState);

  Widget _buildTitleTextField(int action, BuildContext context,
          DocumentSnapshot snapshot, Function(Function()) setState) =>
      _buildTextField(Fields.title, action, context, snapshot, setState);

  Widget _buildDescriptionTextField(int action, BuildContext context,
          DocumentSnapshot snapshot, Function(Function()) setState) =>
      _buildTextField(Fields.description, action, context, snapshot, setState);

  Expanded _buildTextField(String field, int userAction, BuildContext context,
      DocumentSnapshot snapshot, Function(Function()) setState) {
    String _textFieldLabel;
    String _textFieldError;
    TextEditingController _selectedController;
    FocusNode _currentNode;
    FocusNode _nextNode;
    TextInputAction _textInputAction = TextInputAction.next;
    bool _textFieldIsEmpty = false;

    switch (field) {
      case Fields.name:
        _textFieldLabel = "Your Name*";
        _textFieldError = "Please enter your name.";
        _selectedController = _nameInputController;
        _selectedController.text = (userAction == UserAction.update)
            ? denullify(snapshot.data[Fields.name])
            : "";
        _currentNode = _nameNode;
        _nextNode = _titleNode;
        break;

      case Fields.title:
        _textFieldLabel = "Title*";
        _textFieldError = "Please enter title.";
        _selectedController = _titleInputController;
        _selectedController.text = (userAction == UserAction.update)
            ? denullify(snapshot.data[Fields.title])
            : "";
        _currentNode = _titleNode;
        _nextNode = _descriptionNode;
        break;

      case Fields.description:
        _textFieldLabel = "Description*";
        _textFieldError = "Please enter description.";
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
          errorText: _textFieldIsEmpty ? _textFieldError : null,
        ),
        onSubmitted: (value) {
          setState(() {
            _selectedController.text = value;
            _textFieldIsEmpty = (value == null || value == "");
          });
          if (value.isEmpty) {
            _textFieldIsEmpty = true;
          }
          _currentNode.unfocus();
          if (_nextNode != null) {
            _nextNode.requestFocus();
          }
        },
      ),
    );
  }
}
