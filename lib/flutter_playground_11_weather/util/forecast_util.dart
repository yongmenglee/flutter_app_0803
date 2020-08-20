// Section 22: Build a Weather Forecast App

import 'package:intl/intl.dart';

class MeasuringUnit {
  static String metric = "metric";
  static String imperial = "imperial";
}

class Measurement {
  static const String temperature = "temperature";
  static const String humidity = "humidity";
  static const String windSpeed = "wind speed";
}

final String measureUnit = MeasuringUnit.metric;

class Util {
  static String appId = "ENTER_YOUR_OWN_APPID";

  static String getFormattedDate(DateTime dateTime, String dateFormat) {
    return new DateFormat(dateFormat).format(dateTime);
  }

  static String getUnitFor(String measurement) {
    switch (measurement) {
      case Measurement.temperature:
        return (measureUnit == MeasuringUnit.metric) ? "°C" : "°F";
      case Measurement.humidity:
        return "%";
      case Measurement.windSpeed:
        return (measureUnit == MeasuringUnit.metric) ? "km/h" : "mi/h";
      default:
        return "";
    }
  }
}
