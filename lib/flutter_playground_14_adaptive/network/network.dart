// Section 25: [OPTIONAL] Creating Adaptive Flutter Apps

import 'dart:convert';

import 'package:flutterapp0803/flutter_playground_14_adaptive/model/joke.dart';
import 'package:http/http.dart';

class Network {
  final String url;
  Network(this.url);

  Future<JokeList> loadJokes() async {
    final response = await get(Uri.encodeFull(url));

    if (response.statusCode == 200) {
      // Invoke PostList from json
      return JokeList.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to get posts.");
    }
  }
}
