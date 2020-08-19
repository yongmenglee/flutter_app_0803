// Section 22: Build a Weather Forecast App

import 'package:flutter/material.dart';
import 'package:flutterapp0803/flutter_playground_11_weather/model/weather_forecast_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum WeatherInfo {
  humidity,
  windSpeed,
  maxTemp,
}

Widget getWeatherIcon({String weatherDescription, Color color, double size}) {
  IconData weatherIcon;

  switch (weatherDescription.toLowerCase()) {
    case "clear":
      weatherIcon = FontAwesomeIcons.sun;
      break;
    case "clouds":
      weatherIcon = FontAwesomeIcons.cloud;
      break;
    case "rain":
      weatherIcon = FontAwesomeIcons.cloudRain;
      break;
    case "snow":
      weatherIcon = FontAwesomeIcons.snowman;
      break;
    default:
      weatherIcon = FontAwesomeIcons.sun;
  }

  return Icon(weatherIcon, color: color, size: size);
}