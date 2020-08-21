// Section 23: Flutter Google Maps - Building the Earthquakes App

/// Type helper with static functions to deal with cases where
/// ambiguous types are returned from JSON API.
class TypesHelper {
  static const int _int = 1;
  static const int _double = 2;
  static const int _string = 3;

  /// Force conversion of [val] to an integer value.
  static int toInt(dynamic val) {
    return TypesHelper._toType(TypesHelper._int, value: val);
  }

  /// Force conversion of [val] to a double value.
  static double toDouble(dynamic val) {
    return TypesHelper._toType(TypesHelper._double, value: val);
  }

  /// A static function to convert [value] to a specified [type].
  /// Return type is dynamic.
  static dynamic _toType(int type, {dynamic value}) {
    try {
      switch (type) {
        case _int:
          // Convert to Integer
          return (value == null)
              ? 0 // return integer value: 0
              : (value is int) ? value : value.toInt();

        case _double:
          // Convert to Double
          return (value == null)
              ? 0.0 // return double value: 0.0
              : (value is double) ? value : value.toDouble();

        case _string:
          // Convert to String
          return (value == null) ? "" : value.toString();
      }
    } catch (error) {
      print(error);
      return 0;
    }
  }
}
