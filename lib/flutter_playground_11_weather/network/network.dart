// Section 22: Build a Weather Forecast App

import 'dart:convert';
import 'package:http/http.dart';
import 'package:flutterapp0803/flutter_playground_11_weather/model/weather_forecast_model.dart';
import 'package:flutterapp0803/flutter_playground_11_weather/util/forecast_util.dart';

class NetworkStatusCode {
  static const int success = 200;
  static const int badRequest = 400;
  static const int unauthorized = 401;
  static const int notFound = 404;
}

class Network {
  Future<WeatherForecastModel> getWeatherForecast({String cityName}) async {
    var finalUrl =
        "https://api.openweathermap.org/data/2.5/forecast?q=$cityName"
        "&appid=${Util.appId}&units=$measureUnit"; // change to metric or imperial
    final response = await get(Uri.encodeFull(finalUrl));
    var jsonDecoded = json.decode(response.body);

    print("URL: ${Uri.encodeFull(finalUrl)}");
    print("Status code: ${response.statusCode}");

    switch (response.statusCode) {
      case NetworkStatusCode.success:
        return WeatherForecastModel.fromJson(jsonDecoded);
      case NetworkStatusCode.badRequest:
        return WeatherForecastModel(
            cod: NetworkStatusCode.badRequest.toString());
      case NetworkStatusCode.unauthorized:
        return WeatherForecastModel(
            cod: NetworkStatusCode.unauthorized.toString());
      case NetworkStatusCode.notFound:
        return WeatherForecastModel(
            cod: NetworkStatusCode.notFound.toString(),
            city: City(name: cityName));
      default:
        throw Exception("Error getting weather forecast.");
    }
  }
}
