//import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp0803/flutter_playground_13_firestore_board/util/board_util.dart';

class BoardTextField extends StatefulWidget {
  final BuildContext scaffoldContext;
  final DocumentSnapshot snapshot;
  final String field;
  final int userAction;
  final TextEditingController controller;
  final FocusNode currentNode;
  final FocusNode nextNode;

  const BoardTextField(
      {Key key,
      this.scaffoldContext,
      this.snapshot,
      this.field,
      this.userAction,
      this.controller,
      this.currentNode,
      this.nextNode})
      : super(key: key);

//  const BoardTextField(this.scaffoldContext, this.snapshot,
//      this.controller, this.currentNode, this.nextNode)
//      : super(key: key);

  @override
  _BoardTextFieldState createState() => _BoardTextFieldState(scaffoldContext,
      snapshot, field, userAction, controller, currentNode, nextNode);
}

class _BoardTextFieldState extends State<BoardTextField> {
  final BuildContext scaffoldContext;
  final DocumentSnapshot snapshot;
  final String field;
  final int userAction;
  final TextEditingController controller;
  final FocusNode currentNode;
  final FocusNode nextNode;

  _BoardTextFieldState(this.scaffoldContext, this.snapshot, this.field,
      this.userAction, this.controller, this.currentNode, this.nextNode);

  bool _textFieldIsEmpty = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextField(
        controller: controller,
        focusNode: currentNode,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.next,
        autofocus: true,
        autocorrect: true,
        decoration: InputDecoration(
          labelText: _getLabelText(field),
          errorText: _textFieldIsEmpty ? _getErrorText(field) : null,
        ),
        onSubmitted: (val) {
          setState(() {
            _textFieldIsEmpty = (val == null || val == "");
          });

          currentNode.unfocus();
          if (nextNode != null) {
            nextNode.requestFocus();
          }
        },
      ),
    );
  }

  String _getLabelText(String field) {
    switch (field) {
      case Fields.name:
        return "Your Name*";
      case Fields.title:
        return "Title";
      case Fields.description:
        return "Description*";
      default:
        return "";
    }
  }

  String _getErrorText(String field) {
    switch (field) {
      case Fields.name:
        return "Please enter your name.";
      case Fields.title:
        return "Please enter title.";
      case Fields.description:
        return "Please enter description.";
      default:
        return "";
    }
  }
}
