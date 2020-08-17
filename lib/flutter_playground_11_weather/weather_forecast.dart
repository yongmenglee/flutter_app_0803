import 'package:flutter/material.dart';

import 'model/weather_forecast_model.dart';
import 'network/network.dart';

class WeatherForecast extends StatefulWidget {
  @override
  _WeatherForecastState createState() => _WeatherForecastState();
}

class _WeatherForecastState extends State<WeatherForecast> {

  Future<WeatherForecastModel> forecastObject;
  String _cityName = "Kuala Lumpur";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    forecastObject = Network().getWeatherForecast(cityName: _cityName);

    print(forecastObject);

    forecastObject.then((weather) {
      print(weather.city.country);
      print(weather.listA[0].weather[0].main);
    });


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forecast"),
      ),
    );
  }
}
