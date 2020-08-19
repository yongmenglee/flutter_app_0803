// Section 22: Build a Weather Forecast App

import 'package:flutter/material.dart';
import 'package:flutterapp0803/flutter_playground_11_weather/model/weather_forecast_model.dart';
import 'package:flutterapp0803/flutter_playground_11_weather/util/convert_icon.dart';
import 'package:flutterapp0803/flutter_playground_11_weather/util/forecast_util.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum TemperatureInfo {
  tempMax,
  tempMin,
  humidity,
  windSpeed,
}

Widget buildForecastCard(
    BuildContext context, AsyncSnapshot<WeatherForecastModel> snapshot, index) {
  final ListA forecast = snapshot.data.listA[index];
  final DateTime formattedDateTime =
      new DateTime.fromMillisecondsSinceEpoch(forecast.dt * 1000);
  final String dateFormat = "EEEE\nMMM d, HH:mm";
  final String fullDate = Util.getFormattedDate(formattedDateTime, dateFormat);
  final String weatherDesc = forecast.weather[0].main;

  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      // Date
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Text(
            fullDate,
            style: TextStyle(
              fontSize: 12.0,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),

      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
        child: Container(
          height: 0.5,
          color: Theme.of(context).cardTheme.shadowColor,
//        color: Colors.black,
        ),
      ),

      // Row: Weather Icon + Info
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Weather Icon
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: CircleAvatar(
              radius: 30.0,
              backgroundColor: Colors.white,
//              backgroundColor: Colors.transparent,
              child: getWeatherIcon(
                weatherDescription: weatherDesc,
//                color: Colors.pinkAccent,
                color: Theme.of(context).iconTheme.color,
                size: 30.0,
              ),
            ),
          ),

          // Weather Info
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Max temperature
                buildFutureInfoRow(
                    forecast: forecast, info: TemperatureInfo.tempMax),
                SizedBox(height: 1.0),

                // Min temperature
                buildFutureInfoRow(
                    forecast: forecast, info: TemperatureInfo.tempMin),
                SizedBox(height: 1.0),

                // Humidity
                // - Method 1:
//                Text(
//                  "Hum: ${forecast.main.humidity.toStringAsFixed(1)} %",
//                  style: getWeatherInfoTextStyle(),
//                ),
                // - Method 2
                buildFutureInfoRow(
                    forecast: forecast, info: TemperatureInfo.humidity),
                SizedBox(height: 1.0),

                // Wind speed
                // - Method 1
//                Text(
//                  "Win: ${forecast.wind.speed.toStringAsFixed(1)} mi/h",
//                  style: getWeatherInfoTextStyle(),
//                ),
                // - Method 2
                buildFutureInfoRow(
                    forecast: forecast, info: TemperatureInfo.windSpeed),
              ],
            ),
          ),
        ],
      )
    ],
  );
}

Row buildFutureInfoRow({ListA forecast, TemperatureInfo info}) {
  IconData iconData = Icons.arrow_upward;
  String tempReading = "";

  switch (info) {
    case TemperatureInfo.tempMax:
//      iconData = Icons.arrow_upward;
      iconData = FontAwesomeIcons.solidArrowAltCircleUp;
      tempReading = "${forecast.main.tempMax.toStringAsFixed(1)}°F";
      break;
    case TemperatureInfo.tempMin:
//      iconData = Icons.arrow_downward;
      iconData = FontAwesomeIcons.solidArrowAltCircleDown;
      tempReading = "${forecast.main.tempMin.toStringAsFixed(1)}°F";
      break;
    case TemperatureInfo.humidity:
      iconData = FontAwesomeIcons.solidGrinBeamSweat;
      tempReading = "${forecast.main.humidity.toStringAsFixed(1)} %";
      break;
    case TemperatureInfo.windSpeed:
      iconData = FontAwesomeIcons.wind;
      tempReading = "${forecast.wind.speed.toStringAsFixed(1)} mi/h";
  }

  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(right: 5.0),
//        child: CircleAvatar(
//          radius: 8.0,
//          backgroundColor: Colors.white.withOpacity(0.75),
//          child: Icon(
//            iconData,
//            size: 12.0,
//            color: Colors.black,
//          ),
//        ),
        child: Icon(
          iconData,
          size: 12.0,
          color: Colors.black54,
        ),
      ),
      Text(
        tempReading,
        style: getWeatherInfoTextStyle(),
      ),
    ],
  );
}

TextStyle getWeatherInfoTextStyle() {
  return TextStyle(
    fontSize: 12.0,
  );
}
