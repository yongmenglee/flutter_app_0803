// Section 22: Build a Weather Forecast App

import 'package:flutter/material.dart';
import 'package:flutterapp0803/flutter_playground_11_weather/ui/bottom_view.dart';
import 'package:flutterapp0803/flutter_playground_11_weather/ui/mid_view.dart';

import 'model/weather_forecast_model.dart';
import 'network/network.dart';

class WeatherForecast extends StatefulWidget {
  @override
  _WeatherForecastState createState() => _WeatherForecastState();
}

class _WeatherForecastState extends State<WeatherForecast> {
  Future<WeatherForecastModel> forecastObject;
  String _cityName = "Pulau Pinang";

  @override
  void initState() {
    super.initState();
    forecastObject = Network().getWeatherForecast(cityName: _cityName);

    print(forecastObject);

//    forecastObject.then((weather) {
//      print(weather.city.country);
//      print(weather.listA[0].weather[0].main);
//    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        title: Text("Forecast"),
//      ),
      // Note: ListView for scrollable capability.
      body: ListView(
        // Create widget piece by piece.
        children: <Widget>[
          textFieldView(),
          Container(
            child: FutureBuilder<WeatherForecastModel>(
              future: forecastObject,
              builder: (BuildContext context,
                  AsyncSnapshot<WeatherForecastModel> snapshot) {
                print("TEST ${snapshot.data}");

                if (snapshot.hasData) {
                  if (snapshot.data.cod == "200") {
                    return Column(
                      children: <Widget>[
                        midView(snapshot),
                        bottomView(snapshot, context)
                      ],
                    );
                  } else if (snapshot.data.cod == "404") {
                    // StatusCode: 404 => City not found.
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          "City not found!",
                          style: TextStyle(color: Theme.of(context).errorColor),
                        ),
                      ),
                    );
                  }
                  return Text("Error getting weather forecast data.");
                } else {
                  return Container(
                      child: Center(
                    child: CircularProgressIndicator(),
//                        child: Text("Error: City not found!")),
                  ));
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget textFieldView() {
    return Container(
      child: TextField(
        decoration: InputDecoration(
          hintText: "Enter city name",
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          contentPadding: EdgeInsets.all(8.0),
        ),
        onSubmitted: (value) {
          setState(() {
            _cityName = value;

            forecastObject = getWeather(cityName: value);
          });
        },
      ),
    );
  }

  Future<WeatherForecastModel> getWeather({String cityName}) =>
      new Network().getWeatherForecast(cityName: cityName);
}
