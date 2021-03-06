// Section 24: Firestore - Realtime Database - Build a Community Board App

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp0803/flutter_playground_13_firestore_board/util/board_util.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class CustomCard extends StatelessWidget {
  // Google "QuerySnapshot + firestore"
  final BuildContext scaffoldContext;
  final QuerySnapshot snapshot;
  final int index;

  const CustomCard({Key key, this.scaffoldContext, this.snapshot, this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _snapshot = snapshot.documents[index];
    final _snapshotData = _snapshot.data;

    final String _dispName = denullify(_snapshotData[Fields.name]);
    final String _dispTitle = denullify(_snapshotData[Fields.title]);
    final String _dispDesc = denullify(_snapshotData[Fields.description]);

    String _dispDate;

    if (_snapshotData[Fields.timestamp] != null) {
      DateTime timeToDate = new DateTime.fromMillisecondsSinceEpoch(
          _snapshotData[Fields.timestamp].seconds * 1000);
      _dispDate = new DateFormat("EEE, MMM d").format(timeToDate);
    }

    _dispDate = denullify(_dispDate);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 140.0,
          width: MediaQuery.of(context).size.width,
          child: Card(
            elevation: 9.0,
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(scaffoldContext).size.width - 100.0,
                      child: ListTile(
                        title: Text(
                          _dispTitle,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                        subtitle: Text(
                          _dispDesc,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                        ),
                        leading: CircleAvatar(
                          radius: 34.0,
                          child: Text(_dispTitle[0]),
                        ),
                      ),
                    ),
                    _buildCardIcons(_snapshot),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: Text(
                          "By: $_dispName",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.right,
                        ),
                      ),
                      SizedBox(width: 2.0),
                      Text(
                        " ($_dispDate)",
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCardIcons(DocumentSnapshot snapshot) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        _buildUpdateIcon(snapshot),
        _buildDeleteIcon(snapshot),
      ],
    );
  }

  Widget _buildUpdateIcon(DocumentSnapshot snapshot) =>
      _buildIcons(UserAction.update, snapshot: snapshot);

  Widget _buildDeleteIcon(DocumentSnapshot snapshot) =>
      _buildIcons(UserAction.delete, snapshot: snapshot);

  Widget _buildIcons(int userAction, {DocumentSnapshot snapshot}) {
    IconData _iconData;
    Function() _iconAction;

    switch (userAction) {
      case UserAction.update:
        _iconData = FontAwesomeIcons.edit;
        _iconAction = () {
          Util.showUpdateDialog(scaffoldContext, snapshot);
        };
        break;

      case UserAction.delete:
        _iconData = FontAwesomeIcons.trashAlt;
        _iconAction = () {
//          Util.deleteRecord(scaffoldContext, snapshot.documentID);
          Util.showConfirmDeleteDialog(scaffoldContext, snapshot);
        };
        break;

      default:
        break;
    }

    return IconButton(
      icon: Icon(_iconData, size: 15.0),
      onPressed: _iconAction,
    );
  }
}
