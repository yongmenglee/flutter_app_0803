import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp0803/flutter_playground_13_firestore_board/ui/board_action_button.dart';
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
    return AlertDialog(
      contentPadding: EdgeInsets.all(10.0),
      actionsOverflowDirection: VerticalDirection.up,
      title: Text(_setAlertDialogTitle()),
      content: SingleChildScrollView(
        child: Container(
          height: 240.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(_setAlertDialogMessage()),
              _setBoardNameTextField(),
              _setBoardTitleTextField(),
              _setBoardDescriptionTextField(),
            ],
          ),
        ),
      ),
      actions: [
        _setActionButtonOne(),
        _setActionButtonTwo(userAction),
      ],
    );
  }

  Widget _setBoardNameTextField() => _setBoardTextField(Fields.name);

  Widget _setBoardTitleTextField() => _setBoardTextField(Fields.title);

  Widget _setBoardDescriptionTextField() =>
      _setBoardTextField(Fields.description);

  Widget _setBoardTextField(String field) {
    TextEditingController controller;
    FocusNode currentNode;
    FocusNode nextNode;

    switch (field) {
      case Fields.name:
        controller = _nameInputController;
        controller.text = _setFieldDefaultText(Fields.name);
        currentNode = _nameNode;
        nextNode = _titleNode;
        break;

      case Fields.title:
        controller = _titleInputController;
        controller.text = _setFieldDefaultText(Fields.title);
        currentNode = _titleNode;
        nextNode = _descriptionNode;
        break;

      case Fields.description:
        controller = _descriptionInputController;
        controller.text = _setFieldDefaultText(Fields.description);
        currentNode = _descriptionNode;
        break;

      default:
        break;
    }

    return BoardTextField(
        scaffoldContext: scaffoldContext,
        snapshot: snapshot,
        field: field,
        controller: controller,
        currentNode: currentNode,
        nextNode: nextNode);
  }

  Widget _setActionButtonOne() {
    return _setActionButton(UserAction.cancel);
  }

  Widget _setActionButtonTwo(userAction) {
    return _setActionButton(userAction);
  }

  Widget _setActionButton(int userAction) {
    String buttonLabel;

    switch (userAction) {
      case UserAction.cancel:
        buttonLabel = "Cancel".toUpperCase();
        break;
      case UserAction.add:
        buttonLabel = "Save".toUpperCase();
        break;
      case UserAction.update:
        buttonLabel = "Update".toUpperCase();
        break;
      default:
        break;
    }

    return BoardActionButton(
        scaffoldContext: scaffoldContext,
        snapshot: snapshot,
        buttonLabel: buttonLabel,
        userAction: userAction);
  }

  String _setAlertDialogTitle() {
    switch (userAction) {
      case UserAction.add:
        return "Add".toUpperCase();
      case UserAction.update:
        return "Update".toUpperCase();
      default:
        return "";
    }
  }

  String _setAlertDialogMessage() {
    switch (userAction) {
      case UserAction.add:
        return "Please fill in the form.";
      case UserAction.update:
        return "Please fill in the form to update.";
      default:
        return "";
    }
  }

  String _setFieldDefaultText(String field) {
    if (userAction != UserAction.update) return "";

    String valField = denullify(snapshot.data[field]);
    Util.record[field] = valField;

    return valField;
  }
}
