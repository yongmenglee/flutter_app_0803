// Section 22: Build a Weather Forecast App

import 'package:flutter/material.dart';
import 'package:flutterapp0803/flutter_playground_11_weather/ui/view/bottom_view.dart';
import 'package:flutterapp0803/flutter_playground_11_weather/ui/view/error_view.dart';
import 'package:flutterapp0803/flutter_playground_11_weather/ui/view/mid_view.dart';
import 'model/weather_forecast_model.dart';
import 'network/network.dart';

class WeatherForecast extends StatefulWidget {
  @override
  _WeatherForecastState createState() => _WeatherForecastState();
}

class _WeatherForecastState extends State<WeatherForecast> {
  Future<WeatherForecastModel> forecastObject;
  String _cityName = "Sydney";

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
      appBar: AppBar(
        centerTitle: true,
        title: Text("Weather Forecast"),
      ),

      // Note: ListView for scrollable capability.
      body: ListView(
        children: <Widget>[
          // - Text field
          textFieldView(),

          // - Weather forecast
          Container(
            margin: EdgeInsets.all(10.0),
            child: FutureBuilder<WeatherForecastModel>(
              future: forecastObject,
              builder: (BuildContext context,
                  AsyncSnapshot<WeatherForecastModel> snapshot) {
                print("TEST ${snapshot.data}");

                if (snapshot.hasData) {
                  final int _statusCode = int.parse(snapshot.data.cod);

                  if (_statusCode == NetworkStatusCode.success) {
                    return Column(
                      children: <Widget>[
                        MidView(snapshot: snapshot),
                        BottomView(snapshot: snapshot),
                      ],
                    );
                  } else {
                    return ErrorView(snapshot: snapshot);
                  }
                } else {
                  return Container(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget textFieldView() {
    final _controller = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        child: TextField(
          // - Define text editing controller to enable clear text.
          controller: _controller,

          // - Text field decoration.
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            contentPadding: EdgeInsets.all(8.0),
            hintText: "Enter city name",
            prefixIcon: Icon(Icons.search),
            suffixIcon: IconButton(
              // Note: Clear button.
              onPressed: () => _controller.clear(),
              icon: Icon(Icons.clear),
            ),
          ),

          // - Search weather forecast data.
          onSubmitted: (value) {
            _controller.text = value;
            setState(() {
              if (value != "" || value != null) {
                _cityName = value;
                forecastObject = getWeather(cityName: value);
              }
            });
          },
        ),
      ),
    );
  }

  Future<WeatherForecastModel> getWeather({String cityName}) =>
      new Network().getWeatherForecast(cityName: cityName);
}
