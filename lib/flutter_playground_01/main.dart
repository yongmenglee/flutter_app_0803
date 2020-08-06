// Section 12. Building Flutter Apps - Flutter Fundamentals


import 'package:flutter/material.dart';
import 'ui/home.dart';

//void main() => runApp(Home());

//region 66. Flutter Scaffold Widget and Properties
// Takeaway: Scaffold must be enclosed within MaterialApp.

//void main() => runApp(ScaffoldExample()); // invalid

void main() => runApp(new MaterialApp(
  home: ScaffoldExample(),
));

//endregion