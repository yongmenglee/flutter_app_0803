// Section 17: Flutter Intermediate Concepts - Navigation, ListViews -
// Building a Movie App

import 'package:flutter/material.dart';
import 'package:flutterapp0803/flutter_playground_06_movie/model/movie.dart';

// New route (screen or page)
class MovieDetailsView extends StatelessWidget {
  final String movieName;
  final Movie movie;

  const MovieDetailsView({Key key, this.movieName, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies"),
        backgroundColor: Colors.blueGrey.shade900,
      ),
      body: Center(
        child: Container(
          child: RaisedButton(
            child: Text("Go back ${movie.director}"),
            // Implement go back feature.
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ),
    );
  }
}
