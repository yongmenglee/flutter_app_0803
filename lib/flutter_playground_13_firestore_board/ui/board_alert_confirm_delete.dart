import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp0803/flutter_playground_13_firestore_board/util/board_util.dart';

import 'board_action_button.dart';

class BoardAlertConfirmDelete extends StatelessWidget {
  final BuildContext scaffoldContext;
  final DocumentSnapshot snapshot;

  const BoardAlertConfirmDelete({Key key, this.scaffoldContext, this.snapshot})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.all(10.0),
      actionsOverflowDirection: VerticalDirection.up,
      title: Text("Are you sure?"),
      content: Container(
        child: Text(
          "Deleting ${snapshot.data[Fields.title]}...\n"
          "This action cannot be undone.",
        ),
      ),
      actions: [
        _setActionButtonOne(),
        _setActionButtonTwo(),
      ],
    );
  }

  Widget _setActionButtonOne() {
    return _setActionButton(UserAction.cancel);
  }

  Widget _setActionButtonTwo() {
    return _setActionButton(UserAction.delete);
  }

  Widget _setActionButton(int userAction) {
    String buttonLabel;

    switch (userAction) {
      case UserAction.cancel:
        buttonLabel = "Cancel".toUpperCase();
        break;
      case UserAction.delete:
        buttonLabel = "Confirm".toUpperCase();
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
}
