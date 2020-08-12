// Section 17: Flutter Intermediate Concepts - Navigation, ListViews -
// Building a Movie App

import 'package:flutter/material.dart';
import 'package:flutterapp0803/flutter_playground_06_movie/ui/movie_list_view.dart';
import 'package:flutter/services.dart';

//void main () => runApp(app)

void main() {
  // Modify main function to lock screen orientation to Portrait Up only.
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp( // Everything follows the same.
      new MaterialApp(
        title: "Movie App",
        home: new Scaffold(
          body: MovieListView(),
        ),
      ),
    );
  });
}

