// Section 22: Build a Weather Forecast App

import 'package:flutter/material.dart';
import 'package:flutterapp0803/flutter_playground_11_weather/model/weather_forecast_model.dart';
import 'package:flutterapp0803/flutter_playground_11_weather/util/convert_icon.dart';
import 'package:flutterapp0803/flutter_playground_11_weather/util/forecast_util.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // new library for more icons.

Widget midView(AsyncSnapshot<WeatherForecastModel> snapshot) {
  var forecastList = snapshot.data.listA;
  var cityName = snapshot.data.city.name;
  var countryName = snapshot.data.city.country;
  var forecast = forecastList[0];
  var formattedDateTime = new DateTime.fromMillisecondsSinceEpoch(
      forecast.dt * 1000); // millisecond => times 1000.

  Container midView = Container(
    child: Padding(
      padding: const EdgeInsets.all(14.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "$cityName, $countryName",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
              color: Colors.black,
            ),
          ),
          Text(
            "${Util.getFormattedDate(formattedDateTime)}",
            style: TextStyle(fontSize: 15),
          ),
          SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: getWeatherIcon(
                weatherDescription: forecast.weather[0].main,
                color: Colors.pinkAccent,
                size: 198.0),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "${forecast.main.temp.toString()}°F",
                  style: TextStyle(
                    fontSize: 34.0,
                  ),
                ),
                SizedBox(width: 10.0),
                Text(
                  "${forecast.weather[0].description.toUpperCase()}",
                ),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                buildWeatherInfoWidget(forecast, WeatherInfo.windSpeed),
                buildWeatherInfoWidget(forecast, WeatherInfo.humidity),
                buildWeatherInfoWidget(forecast, WeatherInfo.maxTemp),
              ],
            ),
          ),
        ],
      ),
    ),
  );

  return midView;
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
