import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp0803/flutter_playground_13_firestore_board/util/board_util.dart';

class BoardActionButton extends StatelessWidget {
  final BuildContext scaffoldContext;
  final DocumentSnapshot snapshot;
  final String buttonLabel;
  final int userAction;

  const BoardActionButton(
      {Key key,
      this.scaffoldContext,
      this.snapshot,
      this.buttonLabel,
      this.userAction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: _buttonAction,
      child: Text(buttonLabel.toUpperCase()),
    );
  }

  void _buttonAction() {
    switch (userAction) {
      case UserAction.add:
        Util.addRecord(scaffoldContext);
        break;
      case UserAction.update:
        Util.updateRecord(scaffoldContext, snapshot.documentID);
        break;
      case UserAction.delete:
        Util.deleteRecord(scaffoldContext, snapshot.documentID);
        break;
      case UserAction.cancel:
        Util.dismissDialogBox();
        break;
      default:
        break;
    }
  }
}
