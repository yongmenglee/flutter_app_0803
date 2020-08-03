// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

// Run the Flutter App
// - The arrow notation (=>) is used for one-line functions or methods.
void main() => runApp(MyApp());

class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
//    return Container();

//    final wordPair = WordPair.random();
//    return Text(wordPair.asPascalCase);

    return Scaffold(
      appBar: AppBar(
        title: Text('Startup Name Generator'),
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
      padding: EdgeInsets.all((16.0)),
      itemBuilder: (context, i) {
        if (i.isOdd) return Divider();

        final index = i ~/ 2;
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[index]);
      },
    );
  }

  Widget _buildRow(WordPair pair) {
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      )
    );
  }
}

// StatelessWidget: the app itself is made a widget.
class MyApp extends StatelessWidget {
  @override

  // build() method: main job of a widget, describe how to display the widget in
  // terms of other, lower level widgets
  Widget build(BuildContext context) {
//    final wordPair = WordPair.random();

    // Material: visual design language => standard on mobile and the web.
    // - Flutter offers a rich set of Material widgets.
    return MaterialApp(
//      title: 'Welcome to Flutter',
//
//      // Scaffold Widget: Default app bar, title and a body property that holds
//      // the widget tree for the home screen
//      home: Scaffold(
//        appBar: AppBar(
//          title: Text('Welcome to Flutter'),
//        ),
//
//        // A Center widget containing a Text child widget
//        // - aligns its widget subtree to the center of the screen
//        body: Center(
////          child: Text('Hello World'),
////          child: Text(wordPair.asPascalCase),
//          child: RandomWords(),
//        ),
//      ),

      title: 'Startup Name Generator',
      home: RandomWords(),
    );
  }
}
