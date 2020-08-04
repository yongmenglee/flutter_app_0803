// Define helper classes and functions used in the dart playgrounds.

import 'dart:io';
import 'package:intl/intl.dart';

// Helper classes.
// ---
/// An object to store all the print statements in dart playground.
class OutputText {
  static String _appendText = "";

  String get appendText {
    return _appendText;
  }

  void appendNewText(Object object) {
    _appendText += "$object\n";
  }
}

// Helper functions.
// ---
/// Define new print function which stores all the print statements to write
/// into an output file.
void outputPrint(Object object) {
  print(object);
  OutputText().appendNewText(object);
}


/// Print break lines to separate current section from previous sections.
///
/// Called in between each section.
void printBreakLines({String character = "#", int numChar = 1}) {
//  print(character * numChar);
  outputPrint(character * numChar);
}

/// Print lesson title specified by [title] and update lesson count.
///
/// Called at the beginning of every lesson.
int printLessonTitle(String title, {int count = 0}) {
  final maxLength = 60;

  String newCountString = count.toString();
  String newTitle = "| " + newCountString + ". " + title + " |";
  int titleLength = newTitle.length;

  if (titleLength < maxLength) {
    // Insert trailing spaces to the title.
    int titleLengthDiff = maxLength - titleLength;
    newTitle = newTitle.substring(0, titleLength - 1);
    newTitle += (" " * titleLengthDiff) + "|";
  } else if (titleLength > maxLength) {
    // Trim the title with trailing dots (...).
    newTitle = newTitle.substring(0, maxLength - 5);
    newTitle += "... |";
  }

  // Set Horizontal borders
  String horizBorder = "-" * maxLength;

  // Combine all lines
  String titleWithBorders = "\n" + horizBorder + "\n" + newTitle + "\n"
      + horizBorder;

//  print(titleWithBorders);
  outputPrint(titleWithBorders);

  return count + 1;
}

/// Save all print statements into an output file.
void createOutputFile({String filename = "filename"}) {
  final DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm:ss');
  final String formatted = formatter.format(DateTime.now());

  outputPrint("\n(Last updated: $formatted)");

  String currentFolderPath = "lib//dart_playground";
  File myFile = new File("$currentFolderPath//$filename.txt");

  myFile.writeAsString(OutputText().appendText);
}
