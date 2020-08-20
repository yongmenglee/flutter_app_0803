// Section 22: Build a Weather Forecast App

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutterapp0803/flutter_playground_11_weather/model/weather_forecast_model.dart';
import 'package:flutterapp0803/flutter_playground_11_weather/util/forecast_util.dart';
import 'view/mid_view.dart';

class ForecastCardInfo {
  static const int tempMax = 1;
  static const int tempMin = 2;
  static const int humidity = 3;
  static const int windSpeed = 4;
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

      // Divider
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
                    forecast: forecast, info: ForecastCardInfo.tempMax),
                SizedBox(height: 1.0),

                // Min temperature
                buildFutureInfoRow(
                    forecast: forecast, info: ForecastCardInfo.tempMin),
                SizedBox(height: 1.0),

                // Humidity
                buildFutureInfoRow(
                    forecast: forecast, info: ForecastCardInfo.humidity),
                SizedBox(height: 1.0),

                // Wind speed
                buildFutureInfoRow(
                    forecast: forecast, info: ForecastCardInfo.windSpeed),
              ],
            ),
          ),
        ],
      )
    ],
  );
}

Widget buildFutureInfoRow({ListA forecast, int info}) {
  IconData iconData = Icons.arrow_upward;
  String reading = "";
  String unit = "";

  switch (info) {
    case ForecastCardInfo.tempMax:
//      iconData = Icons.arrow_upward;
      iconData = FontAwesomeIcons.solidArrowAltCircleUp;
      unit = Util.getUnitFor(Measurement.temperature);
      reading = "${forecast.main.tempMax.toStringAsFixed(1)}$unit";
      break;
    case ForecastCardInfo.tempMin:
//      iconData = Icons.arrow_downward;
      iconData = FontAwesomeIcons.solidArrowAltCircleDown;
      unit = Util.getUnitFor(Measurement.temperature);
      reading = "${forecast.main.tempMin.toStringAsFixed(1)}$unit";
      break;
    case ForecastCardInfo.humidity:
      iconData = FontAwesomeIcons.solidGrinBeamSweat;
      unit = Util.getUnitFor(Measurement.humidity);
      reading = "${forecast.main.humidity.toStringAsFixed(1)} $unit";
      break;
    case ForecastCardInfo.windSpeed:
      iconData = FontAwesomeIcons.wind;
      unit = Util.getUnitFor(Measurement.windSpeed);
      reading = "${forecast.wind.speed.toStringAsFixed(1)} $unit";
  }

  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(right: 5.0),
        child: Icon(
          iconData,
          size: 12.0,
          color: Colors.black54,
        ),
      ),
      Text(
        reading,
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
