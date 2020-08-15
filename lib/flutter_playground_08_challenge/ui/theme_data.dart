// Section: Challenge - App Theme

import 'package:flutter/material.dart';
//import 'package:flutterapp0803/flutter_playground_04_tip_calculator/util/hexcolor.dart';
//import '../util/colors.dart';

final ThemeData appTheme = _buildAppTheme();

Color primaryBrown = Color(0xffbcaaa4);
Color primaryBrownLight = Color(0xffefdcd5);
Color primaryBrownDark = Color(0xff8e7c75);

Color secondaryGreen = Color(0xff2e7d32);
Color secondaryGreenLight = Color(0xff60ad5e);
Color secondaryGreenDark = Color(0xff005005);

Color white = Colors.white;
Color black = Colors.black;
Color errorRed = Colors.red;
Color inactiveGrey = Colors.grey;

final double appMainFontSize = 14.0;

/// Create an actual base theme
ThemeData _buildAppTheme() {
  // Define a base theme data, we will be using this base theme
  // to leverage the theme customization.

  final ThemeData base = ThemeData.light();

  // Note: specify customization/overridden properties in copyWith
  return base.copyWith(
    primaryColor: primaryBrown,
    accentColor:
        primaryBrownDark, // scroll to the top, the transparent part on the top
    cursorColor: secondaryGreen,
    textSelectionColor: secondaryGreenLight,
    textSelectionHandleColor: secondaryGreenDark,

    textTheme: _appTextTheme(base.textTheme), // Refactored text theme
    sliderTheme: _appSliderTheme(base.sliderTheme),
    buttonTheme: base.buttonTheme.copyWith(
      buttonColor: secondaryGreen,
    ),

    inputDecorationTheme: base.inputDecorationTheme.copyWith(
      prefixStyle: TextStyle(
        color: primaryBrownDark,
        fontSize: appMainFontSize,
      ),
//      labelStyle: TextStyle(color: black, fontSize: 38.0),
    ),

    colorScheme: ColorScheme(
        primary: primaryBrown,
        primaryVariant: primaryBrownLight,
        secondary: secondaryGreen,
        secondaryVariant: secondaryGreenLight,
        surface: white,
        background: white,
        error: errorRed,
        onPrimary: black,
        onSecondary: black,
        onSurface: black,
        onBackground: black,
        onError: white,
        brightness: Brightness.light),
  );
}

_appSliderTheme(SliderThemeData base) {
  return base.copyWith(
    activeTrackColor: secondaryGreen,
    activeTickMarkColor: secondaryGreen,
    inactiveTrackColor: inactiveGrey,
    inactiveTickMarkColor: inactiveGrey,
    thumbColor: secondaryGreen,
//    valueIndicatorColor: _secondaryGreenLight,
    overlayColor: secondaryGreenLight.withOpacity(0.35),

//    overlappingShapeStrokeColor: _secondaryGreenLight,
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
          fontSize: 14.0,
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
          fontSize: 14.0,
//          color: Colors.white,
//      // Add custom font into Flutter project.
//      fontFamily: "LobsterTwo",
//          shadows: [
//            Shadow(
//              color: Colors.blueGrey.shade900,
//              offset: Offset(2.0, 2.0),
//              blurRadius: 5.0,
//            ),
//          ],
        ),
      )
      .apply(
        // Apply general setting to all texts within the app.
        fontFamily: "Alata",
//        displayColor: Colors.amber,
//        bodyColor: Colors.red,
      );
}
