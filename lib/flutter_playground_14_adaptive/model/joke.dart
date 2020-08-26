// Section 25: [OPTIONAL] Creating Adaptive Flutter Apps

import 'package:flutter/foundation.dart';

class JokeList {
  final List<Joke> jokes;

  JokeList({this.jokes});

  factory JokeList.fromJson(List<dynamic> parsedJson) {
    List<Joke> jokes = new List<Joke>();

    // map: a method in List
    jokes = parsedJson.map((i) => Joke.fromJson(i)).toList();

    return new JokeList(jokes: jokes); // Post[0].userId
  }
}

class Joke {
  int id;
  String type;
  String setup;
  String punchline;

  Joke(
      {@required this.id,
      @required this.type,
      @required this.setup,
      @required this.punchline});

  Joke.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    setup = json['setup'];
    punchline = json['punchline'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['setup'] = this.setup;
    data['punchline'] = this.punchline;
    return data;
  }
}
