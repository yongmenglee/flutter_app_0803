// Section 22: Build a Weather Forecast App

import 'package:flutter/material.dart';
import 'package:flutterapp0803/flutter_playground_11_weather/model/weather_forecast_model.dart';

Widget bottomView(
    AsyncSnapshot<WeatherForecastModel> snapshot, BuildContext context) {
  var forecastList = snapshot.data.listA;
  var lengthFixed = 7;

  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      Text(
        "7-Day Weather Forecast".toUpperCase(),
        style: TextStyle(
          fontSize: 14.0,
          color: Colors.black87,
        ),
      ),
      Container(
        height: 170.0,
        padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 10.0),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) => SizedBox(width: 8),
          itemCount: lengthFixed,
          itemBuilder: (context, index) => ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            child: Container(
                width: MediaQuery.of(context).size.width /
                    2.7, // can change 2.7 to something else
                height: 160,
//                child: buildForecastCard(snapshot, index),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xff9661c3), Colors.white],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                )),
          ),
        ),
      ),
    ],
  );
}
