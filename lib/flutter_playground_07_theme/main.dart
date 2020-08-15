// Section 18. Understanding Themes in Flutter

import 'package:flutter/material.dart';
import 'ui/quiz_app.dart';

final ThemeData _appTheme = _buildAppTheme();

/// Create an actual base theme
ThemeData _buildAppTheme() {
  // Define a base theme data, we will be using this base theme
  // to leverage the theme customization.
  final ThemeData base = ThemeData.dark();

  // Note: specify customization/overridden properties in copyWith
  return base.copyWith(
    brightness: Brightness.dark,
    accentColor: Colors.amber[800],
    primaryColor: Colors.green,
    scaffoldBackgroundColor: Colors.red,
    backgroundColor: Colors.amber,
    textTheme: _appTextTheme(base.textTheme), // Refactored text theme
  );
}

TextTheme _appTextTheme(TextTheme base) {
  return base
      .copyWith(
        // headline => headline5
        headline5: base.headline5.copyWith(
          fontWeight: FontWeight.w500,
        ),
        // title => headline6
        headline6: base.headline6.copyWith(
          fontSize: 18.0,
        ),
//    // subtitle => subtitle2
//    subtitle2: base.subtitle2.copyWith(),
        caption: base.caption.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 14.0,
        ),
        button: base.button.copyWith(
//      fontFamily: "LobsterTwo",
//      letterSpacing: 3.0,
//      fontSize: 23.9,
//      backgroundColor: Colors.red
            ),
        // body1 => bodyText2
        bodyText2: base.bodyText2.copyWith(
          fontSize: 16.9,
          color: Colors.white,
//      // Add custom font into Flutter project.
//      fontFamily: "LobsterTwo",
          shadows: [
            Shadow(
              color: Colors.blueGrey.shade900,
              offset: Offset(2.0, 2.0),
              blurRadius: 5.0,
            ),
          ],
        ),
      )
      .apply(
        // Apply general setting to all texts within the app.
        fontFamily: "LobsterTwo",
        displayColor: Colors.amber,
        bodyColor: Colors.red,
      );
}

//void main() => runApp(new MaterialApp(
void main() => runApp(
      new MaterialApp(
        title: 'Flutter Playground',
//  home: QuizApp(),
        home: new Scaffold(body: QuizApp()),
        // Note: Rerun the app (instead of using Hot Reload) to view theme changes.
//      theme: ThemeData(
//        brightness: Brightness.dark,
//        // Color framework in Material Design
//        // Primary color: Color that dominates the app UI
//        // Accent color: Popups and dialogs
//        primaryColor:
//            Colors.deepPurple[400], // Use [] to state the color intensity.
//        // Material design: primary color is distributed to
//        // the other parts of the app accordingly.
//
//        textTheme: TextTheme(
//          // No changes to the original app
//          headline5: TextStyle(
//            fontSize: 34.0,
//            fontWeight: FontWeight.bold,
//          ),
//
//          // Quiz question text
//          bodyText2: TextStyle(
//            fontSize: 16.0,
//            color: Colors.white,
//            shadows: [
//              Shadow(
//                color: Colors.blueGrey.shade900,
//                offset: Offset(2.0, 2.0),
//                blurRadius: 5.0,
//              ),
//            ],
//          ),
//        ),
//      ),
        theme: _appTheme,
      ),
    );
