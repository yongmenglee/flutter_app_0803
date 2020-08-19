// Section 22: Build a Weather Forecast App

import 'package:intl/intl.dart';

class Util {
//  static String appId = "<Use your own appId>";
  static String appId = "a2ded99b8ead93e3209b8f88a21e469c";

  static String getFormattedDate(DateTime dateTime, String dateFormat) {
    return new DateFormat(dateFormat).format(dateTime);
    // ... 1999
  }
}
