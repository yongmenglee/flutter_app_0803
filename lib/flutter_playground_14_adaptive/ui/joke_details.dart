// Section 25: [OPTIONAL] Creating Adaptive Flutter Apps

import 'package:flutter/material.dart';
import 'package:flutterapp0803/flutter_playground_14_adaptive/model/joke.dart';

class JokeDetails extends StatelessWidget {
  final bool isInTabletLayout;
  final Joke joke;

  const JokeDetails(
      {Key key, @required this.isInTabletLayout, @required this.joke})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Use textTheme to show header and subheader.
    final TextTheme textTheme = Theme.of(context).textTheme;
    final Widget content = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            joke?.setup ?? "No joke selected", // Similar to Swift.
            style: textTheme.headline5,
            textAlign: TextAlign.center,
          ),
        ),
        Text(
          joke?.punchline ?? "Please select a joke on the left",
          style: textTheme.headline6,
          textAlign: TextAlign.center,
        ),
      ],
    );

    if (isInTabletLayout) {
      return Center(
        child: content,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(joke?.type ?? "No jokes."),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Center(
        child: content,
      ),
    );
  }
}
