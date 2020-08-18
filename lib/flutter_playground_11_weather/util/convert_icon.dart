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

Widget buildWeatherInfoWidget(ListA forecast, WeatherInfo info) {
  String infoText = "";
  IconData infoIcon;

  switch (info) {
    case WeatherInfo.windSpeed:
      infoText = "${forecast.wind.speed.toStringAsFixed(1)} mi/h";
      infoIcon = FontAwesomeIcons.wind;
      break;
    case WeatherInfo.humidity:
      infoText = "${forecast.main.humidity.toStringAsFixed(1)} %";
      infoIcon = FontAwesomeIcons.solidGrinBeamSweat;
      break;
    case WeatherInfo.maxTemp:
      infoText = "${forecast.main.tempMax.toStringAsFixed(1)}°F";
      infoIcon = FontAwesomeIcons.temperatureHigh;
  }

  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(infoText),
        Icon(
          infoIcon,
          size: 20.0,
          color: Colors.brown,
        )
      ],
    ),
  );
}
