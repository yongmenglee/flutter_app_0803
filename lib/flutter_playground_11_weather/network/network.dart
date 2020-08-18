// Section 22: Build a Weather Forecast App

import 'dart:convert';

import 'package:flutterapp0803/flutter_playground_11_weather/model/weather_forecast_model.dart';
import 'package:flutterapp0803/flutter_playground_11_weather/util/forecast_util.dart';
import 'package:http/http.dart';

// Not changing
class Network {
  Future<WeatherForecastModel> getWeatherForecast({String cityName}) async {
    var finalUrl =
        "https://api.openweathermap.org/data/2.5/forecast?q=$cityName"
        "&appid=${Util.appId}&units=imperial"; // change to metric or imperial
    final response = await get(Uri.encodeFull(finalUrl));
    var jsonDecoded = json.decode(response.body);

    print("URL: ${Uri.encodeFull(finalUrl)}");
    print("Status code: ${response.statusCode}");

    if (response.statusCode == 200) {
      // Get the actual mapped model (Dart object)
//      print("Weather data: ${response.body}");

      return WeatherForecastModel.fromJson(jsonDecoded);
    } else if (response.statusCode == 404) {
//      print("City not found!");

      return WeatherForecastModel(cod: "404");
    } else {
      throw Exception("Error getting weather forecast");
    }
  }
}
