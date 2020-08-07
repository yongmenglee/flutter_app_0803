// Section 12. Building Flutter Apps - Flutter Fundamentals

import 'package:flutter/material.dart';
import 'ui/home.dart';

//void main() => runApp(Home());

//void main() => runApp(ScaffoldExample()); // invalid
void main() => runApp(new MaterialApp(
  home: ScaffoldExample(),
));
