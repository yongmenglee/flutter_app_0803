import 'package:flutter/material.dart';
import 'package:flutterapp0803/flutter_playground_12_2_quakes/model/quake_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'network/network.dart';

class QuakesApp extends StatefulWidget {
  @override
  _QuakesAppState createState() => _QuakesAppState();
}

class _QuakesAppState extends State<QuakesApp> {
  Future<QuakeModel> _quakesData;

  @override
  void initState() {
    _quakesData = Network().getQuake();
    _quakesData.then((values) => {
      print("Place: ${values.features[0].properties.place}")
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
