// Section 14. Flutter Stateful Widgets

import 'package:flutter/material.dart';

class Quote extends StatefulWidget {
  @override
  _QuoteState createState() => _QuoteState();
}

class _QuoteState extends State<Quote> {
  final listQuotes = [
    "\"Spread love everywhere you go. Let no one ever come to you without leaving happier.\" -Mother Teresa",
    "\"When you reach the end of your rope, tie a knot in it and hang on.\" -Franklin D. Roosevelt",
    "\"Always remember that you are absolutely unique. Just like everyone else.\" -Margaret Mead",
    "\"Don't judge each day by the harvest you reap but by the seeds that you plant.\" -Robert Louis Stevenson",
    "\"The future belongs to those who believe in the beauty of their dreams.\" -Eleanor Roosevelt",
    "\"Tell me and I forget. Teach me and I remember. Involve me and I learn.\" -Benjamin Franklin",
    "\"The best and most beautiful things in the world cannot be seen or even touched - they must be felt with the heart.\" -Helen Keller",
    "\"It is during our darkest moments that we must focus to see the light.\" -Aristotle",
    "\"Whoever is happy will make others happy too.\" -Anne Frank",
    "\"Do not go where the path may lead, go instead where there is no path and leave a trail.\" -Ralph Waldo Emerson"
  ];

  int _index = 0;

  @override
  Widget build(BuildContext context) {
    // Create UI
    return Scaffold(
        body: Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Spacer(),
          Expanded(
            // Expanded: expand the needed space as we want.
            child: Container(
                width: 350,
                height: 200,
                margin: EdgeInsets.all(30.0),
                decoration: BoxDecoration(
//                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(14.5),
                ),
                child: Center(
                    child: Text(listQuotes[_index],
                        style: TextStyle(
                            color: Colors.grey.shade100,
                            fontStyle: FontStyle.italic,
                            fontSize: 16.5)))),
          ),
          Divider(
            thickness: 0.5,
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: FlatButton.icon(
                onPressed: _showQuote,
                color: Colors.black26,
                icon: Icon(
                  Icons.lightbulb_outline,
                  color: Colors.yellow.shade300,
                ),
                label: Text("Inspire me! 🤗",
                    style: TextStyle(
                      color: Colors.yellow.shade200,
                      fontSize: 18.8,
                    ))),
          ),
          Spacer(),
        ],
      ),
    ),
    backgroundColor: Colors.blueGrey.shade400);
  }

  void _showQuote() {
    // Increment our index/counter by 1
    // Wrap the increment into setState - redraw the Widget.
    setState(() {
      _index = (_index + 1) % listQuotes.length;
    });
  }
}
