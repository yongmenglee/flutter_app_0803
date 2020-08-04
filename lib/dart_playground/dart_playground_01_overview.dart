// Section 6: Introduction to the Dart Programming Language - From Scratch

// Main method - everything enclosed within is being called
// - something happens
void main() { // entry point
  int lessonCount = 0;
  String lessonTitle = "";

  /// Print break lines to separate current section from previous sections.
  ///
  /// Called in between each section.
  void printBreakLines({String character = "#", int numChar = 1}) {
    print(character*numChar);
  }

  /// Print lesson title specified by [title] and update lesson count.
  ///
  /// Called at the beginning of every lesson.
  int printLessonTitle(String title, {int count = 0}) {
    int newCount = count + 1;
    String newCountString = newCount.toString();
    String newTitle = "| " + newCountString + ". " + title + " |";
    int titleLength = newTitle.length;

    const maxLength = 60;

    // Insert trailing spaces to the title until it reaches 60 characters.
    if (titleLength < maxLength) {
      int titleLengthDiff = maxLength - titleLength;
      newTitle = newTitle.substring(0, titleLength - 1);
      newTitle += (" " * titleLengthDiff) + "|";

      titleLength = maxLength;
    }

    // Set Horizontal borders
    String horizBorder = "-" * titleLength;
    String titleWithBorders = "";

    // Combine all lines
    titleWithBorders += "\n" + horizBorder + "\n" + newTitle + "\n" +
        horizBorder;

    print(titleWithBorders);

    return newCount;
  }


  // =========================================================================
  print('Hello world');


  // =========================================================================
  // Intro to Dart and Dart Pad - Online Editor
  lessonTitle = "Intro to Dart and Dart Pad - Online Editor";
  lessonCount = printLessonTitle(lessonTitle, count: lessonCount);

  var a = "Darren";
  var b = "Green";

  print(a);
  print(a+b);

  printBreakLines();

  for (int i = 0; i < 5; i++) {
    print('Hello ${i+1}');
  }


  // =========================================================================
  // 17. Dart - Coding Style and Naming Convention
  lessonTitle = "Dart - Coding Style and Naming Convention";
  lessonCount = printLessonTitle(lessonTitle, count: lessonCount);

  String URL = "https://dart.dev/guides/language/effective-dart#summary-of-all-rules";
  print("Go to [${URL}] for more information.");


  // =========================================================================
  // 18. Dart - Declaring variables - String
  lessonTitle = "Dart - Declaring variables - String";
  lessonCount = printLessonTitle(lessonTitle, count: lessonCount);

  print('Hello world');

  printBreakLines();

  // - Variable = spot in memory. Or just a bucket to hold a value.
  var country = "Malaysia"; // String
  print(country);


  // =========================================================================
  // 19. Dart Types and Assigning Types to Variables
  lessonTitle = "Dart Types and Assigning Types to Variables";
  lessonCount = printLessonTitle(lessonTitle, count: lessonCount);

  // - Type??
  /*
  * String
  * Number (integers and doubles)
  * Boolean
  * Lists
  * Maps
  * ... */

  // There are 2 methods to define a variable.

  // Method 1 - Direct assignment (generic type)
  // We can assign values of different types to any variable, for example:
  // var country = 1  // Number (integers or doubles)

  // Method 2 - Two-step assignment
  // We can also explicitly specify variable type
  String name;
  name = "Darren"; // valid
//  name = 1; // invalid

  print(name);


  // =========================================================================
  // 20. Dart - Numbers - Integers and Doubles
  lessonTitle = "Dart - Numbers - Integers and Doubles";
  lessonCount = printLessonTitle(lessonTitle, count: lessonCount);

  num age = 13;
//  var age = 13; // alternative
  print(age);

  printBreakLines();

  num number = 23;
  print(number);

  printBreakLines();

  // Integers are numbers without a decimal point. 1, 2, 3, 5, 10, etc.
  // Doubles do have a decimal point, 1.1, 0.2, etc.

  int ageInt = 13;
  double numberDouble = 23.34;

  print(numberDouble);


  // =========================================================================


}