// Section 22: Build a Weather Forecast App

import 'package:flutter/material.dart';
import 'weather_forecast.dart';

//region Theme

// Primary color palette
class AppColor {
  // Primary colors - Teal
  static Color primary = Color(0xff7edeea);
  static Color primaryLight = Color(0xffb2ffff);
  static Color primaryDark = Color(0xff48acb8);

  // Secondary colors - Light brown
  static Color secondary = Color(0xffffccbc);
  static Color secondaryLight = Color(0xffffffee);
  static Color secondaryDark = Color(0xffcb9b8c);
}

ThemeData mainTheme = ThemeData.light();

ThemeData _appTheme = mainTheme.copyWith(
  primaryColor: AppColor.primary,
  primaryColorLight: AppColor.primaryLight,
  primaryColorDark: AppColor.primaryDark,
  scaffoldBackgroundColor: Colors.white,
  accentColor: AppColor.secondaryDark,
  splashColor: AppColor.secondaryLight,
  cursorColor: AppColor.primaryDark,
  textSelectionColor: AppColor.primaryLight.withOpacity(0.5),
  textSelectionHandleColor: AppColor.primaryDark,
  cardTheme: getCardTheme(),
  iconTheme: getIconTheme(),
  textTheme: getTextTheme(),
);

getCardTheme() {
  return mainTheme.cardTheme.copyWith(
    color: AppColor.primary,
    shadowColor: AppColor.primaryDark,
  );
}

getIconTheme() {
  return mainTheme.iconTheme.copyWith(
    color: AppColor.secondaryDark,
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
