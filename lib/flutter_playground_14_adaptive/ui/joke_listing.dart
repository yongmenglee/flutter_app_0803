// Section 25: [OPTIONAL] Creating Adaptive Flutter Apps

import 'package:flutter/material.dart';
import 'package:flutterapp0803/flutter_playground_14_adaptive/model/joke.dart';
import 'package:flutterapp0803/flutter_playground_14_adaptive/network/network.dart';

class JokeListing extends StatelessWidget {
  final ValueChanged<Joke> jokeSelectedCallback;
  final Joke jokeSelected;

  const JokeListing(
      {Key key, @required this.jokeSelectedCallback, this.jokeSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Network network = Network(
        "https://raw.githubusercontent.com/15Dkatz/jokes-api-ruby/master/data/jokes.json");
    Future<JokeList> data = network.loadJokes();

    return FutureBuilder(
      future: data,
      builder: (context, AsyncSnapshot<JokeList> snapshot) {
        List<Joke> allJokes;

        if (!(snapshot.hasData)) return CircularProgressIndicator();

        allJokes = snapshot.data.jokes;

        return ListView(
          // Use .map() function to populate all elements to the list.
          children: allJokes.map((joke) {
            return Container(
              child: ListTile(
                title: Text(joke.setup),
                onTap: () => jokeSelectedCallback(joke),
                selected: jokeSelected == joke,
              ),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(4.5),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
