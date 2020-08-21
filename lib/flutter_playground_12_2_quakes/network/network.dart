// Section 23: Flutter Google Maps - Building the Earthquakes App

import 'dart:convert';
import 'package:http/http.dart';
import 'package:flutterapp0803/flutter_playground_12_2_quakes/model/quake_model.dart';
import 'package:flutterapp0803/flutter_playground_12_2_quakes/util/quake_util.dart';

class Network {
  Future<QuakeModel> getQuake() async {
    final apiUrl = Util.api;
    final response = await get(Uri.encodeFull(apiUrl));

    if (response.statusCode == 200) {
      print("Quake data: ${response.body}"); // Test

      final jsonDecoded = json.decode(response.body);
      return QuakeModel.fromJson(jsonDecoded);
    } else {
      throw Exception("Error getting quakes data.");
    }
  }
}
