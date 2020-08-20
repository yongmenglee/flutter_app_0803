import 'package:flutter/material.dart';
import 'package:flutterapp0803/flutter_playground_11_weather/model/weather_forecast_model.dart';
import 'package:flutterapp0803/flutter_playground_11_weather/network/network.dart';

class ErrorView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecastModel> snapshot;
  const ErrorView({Key key, this.snapshot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int _statusCode = int.parse(snapshot.data.cod);
    final String _errorMessage = getErrorMessage(_statusCode);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Text(
          _errorMessage,
          style: TextStyle(
            color: Theme.of(context).errorColor,
          ),
        ),
      ),
    );
  }

  String getErrorMessage(int statusCode) {
    String _errorMessage = "";

    switch (statusCode) {
      case NetworkStatusCode.badRequest:
        _errorMessage = "Please enter city name.";
        break;
      case NetworkStatusCode.notFound:
        _errorMessage =
        "The city \"${snapshot.data.city.name}\" cannot be found!";
        break;
      case NetworkStatusCode.unauthorized:
        _errorMessage = "The request could not be authorized.";
        break;
      default:
        _errorMessage = "Error getting weather forecast data.";
    }

    return _errorMessage;
  }
}
