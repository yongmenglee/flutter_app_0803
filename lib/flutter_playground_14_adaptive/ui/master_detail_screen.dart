// Section 25: [OPTIONAL] Creating Adaptive Flutter Apps

import 'package:flutter/material.dart';
import 'package:flutterapp0803/flutter_playground_14_adaptive/model/joke.dart';

import 'joke_details.dart';
import 'joke_listing.dart';

class MasterDetailScreen extends StatefulWidget {
  @override
  _MasterDetailScreenState createState() => _MasterDetailScreenState();
}

// Place where things start to happen.
class _MasterDetailScreenState extends State<MasterDetailScreen> {
  static const int tabletBreakpoint = 600;
  Joke _selectedJoke;

  // Need to create 2 different layouts
  Widget _buildMobileLayout() {
    return JokeListing(
      jokeSelectedCallback: (jokeSelected) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) {
              return JokeDetails(
                  isInTabletLayout: false, // false for mobile layout
                  joke: jokeSelected);
            },
          ),
        );
      },
    );
  }

  Widget _buildTabletLayout() {
    return Row(
      children: [
        Flexible(
          // Flexible: to divide screen into left and right.
          flex: 1,
          child: Material(
            // Material: to enhance the appearance (elevation)
            elevation: 13.0,
            child: JokeListing(
              jokeSelectedCallback: (joke) {
                setState(() {
                  _selectedJoke = joke;
                });
              },
              jokeSelected: _selectedJoke,
            ),
          ),
        ),
        Flexible(
          flex: 3,
          child: JokeDetails(
            isInTabletLayout: true,
            joke: _selectedJoke,
          ),
        ),
      ],
    );
  }
  // ===

  @override
  Widget build(BuildContext context) {
//    Widget content;

    // shortestSide tells us whether we are on a mobile phone or tablet.
    // - breakpoint: 600.
    var shortestSide = MediaQuery.of(context).size.shortestSide;
    var orientation = MediaQuery.of(context).orientation;

    bool currentLayoutIsMobile = ((orientation == Orientation.portrait) &&
        (shortestSide < tabletBreakpoint));

    Widget content =
        currentLayoutIsMobile ? _buildMobileLayout() : _buildTabletLayout();

    return Scaffold(
      appBar: AppBar(
        title: Text("Jokes"),
      ),
      body: content,
    );
  }
}
