// Section 17: Flutter Intermediate Concepts - Navigation, ListViews -
// Building a Movie App

import 'package:flutter/material.dart';
import 'package:flutterapp0803/flutter_playground_06_movie/ui/movie_list_view.dart';

//void main () => runApp(app)

void main() => runApp(
      new MaterialApp(
        title: "Movie App",
        home: new Scaffold(
          body: MovieListView(),
        ),
      ),
    );
