// Section 22: Build a Weather Forecast App

import 'package:flutter/material.dart';
import 'weather_forecast.dart';

//region Theme

// Primary color palette
const Color primaryColor = Color(0xff7edeea);
const Color primaryColorLight = Color(0xffb2ffff);
const Color primaryColorDark = Color(0xff48acb8);

// Secondary color palette
const Color secondaryColor = Color(0xffffccbc);
const Color secondaryColorLight = Color(0xffffffee);
const Color secondaryColorDark = Color(0xffcb9b8c);

ThemeData mainTheme = ThemeData.light();

ThemeData _appTheme = mainTheme.copyWith(
  primaryColor: primaryColor,
  primaryColorLight: primaryColorLight,
  primaryColorDark: primaryColorDark,
  scaffoldBackgroundColor: Colors.white,
  accentColor: secondaryColorDark,
  splashColor: secondaryColorLight,
  cursorColor: primaryColorDark,
  textSelectionColor: primaryColorLight.withOpacity(0.5),
  textSelectionHandleColor: primaryColorDark,
  cardTheme: getCardTheme(),
  iconTheme: getIconTheme(),
  textTheme: getTextTheme(),
);

getCardTheme() {
  return mainTheme.cardTheme.copyWith(
    color: primaryColor,
    shadowColor: primaryColorDark,
  );
}

getIconTheme() {
  return mainTheme.iconTheme.copyWith(
    color: secondaryColorDark,
  );
}

getTextTheme() {
  return mainTheme.textTheme.copyWith().apply(
        fontFamily: "Rubik",
      );
}

//endregion

void main() => runApp(
      new MaterialApp(
        home: WeatherForecast(),
        theme: _appTheme,
      ),
    );
