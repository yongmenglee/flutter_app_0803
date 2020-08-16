import 'package:flutter/material.dart';
import 'ui/mortgage_app.dart';
import 'util/colors.dart';

final ThemeData _mortgateTheme = _buildMortgageTheme();

ThemeData _buildMortgageTheme() {
  final ThemeData base = ThemeData.light();

  return base.copyWith(
    accentColor: primaryIndigoDark,
    primaryColor: primaryIndigo200,
    scaffoldBackgroundColor: secondaryBackgroundWhite,
    hintColor: textOnPrimaryBlack,
    cardColor: secondaryDeepPurple,
    textTheme: _buildMortgageTextTheme(base.textTheme),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderSide: BorderSide(color: primaryIndigoLight),
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    floatingActionButtonTheme: base.floatingActionButtonTheme.copyWith(
      elevation: 7.0,
      splashColor: primaryIndigoLight,
      backgroundColor: secondaryDeepPurple,
    ),
    sliderTheme: base.sliderTheme.copyWith(
      activeTrackColor: secondaryDeepPurple,
      inactiveTrackColor: Colors.grey,
      thumbColor: secondaryPurpleDark,
      overlayColor: secondaryPurpleDark.withOpacity(0.25),
    ),
  );
}

_buildMortgageTextTheme(TextTheme base) {
  return base.copyWith(
    bodyText2: TextStyle(
      color: textOnPrimaryBlack,
      fontSize: 16.0,
    ),
  ).apply(
    fontFamily: "Rubik",
//    fontFamily: "LobsterTwo",
  );
}

void main() => runApp(new MaterialApp(
      home: MortgageApp(),
      theme: _mortgateTheme,
    ));
