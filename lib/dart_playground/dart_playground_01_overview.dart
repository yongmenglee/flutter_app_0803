// Section 6: Introduction to the Dart Programming Language - From Scratch

// Import helper functions
import 'dart_playground_00_helper.dart';

// Main method - everything enclosed within is being called
// - something happens
void main() { // entry point
  int lessonCount = 0;
  String lessonTitle = "";


  // =========================================================================
  print('Hello world');


  // =========================================================================
  // 16. Intro to Dart and Dart Pad - Online Editor
  lessonTitle = "Intro to Dart and Dart Pad - Online Editor";
  lessonCount = printLessonTitle(lessonTitle, count: 16);

  var aLesson16 = "Darren";
  var bLesson16 = "Green";

  print("a: $aLesson16, b: $bLesson16");
  print("> a: $aLesson16");
  print("> a + b: ${aLesson16 + bLesson16}");

  printBreakLines();

  print("Printing for loop...");

  for (int i = 0; i < 5; i++) {
    print('Hello ${i + 1}');
  }


//  ------------------------------------------------------------
//  | 16. Intro to Dart and Dart Pad - Online Editor           |
//  ------------------------------------------------------------
//  a: Darren, b: Green
//  > a: Darren
//  > a + b: DarrenGreen
//  #
//  Printing for loop...
//  Hello 1
//  Hello 2
//  Hello 3
//  Hello 4
//  Hello 5


  // =========================================================================
  // 17. Dart - Coding Style and Naming Convention
  lessonTitle = "Dart - Coding Style and Naming Convention";
  lessonCount = printLessonTitle(lessonTitle, count: lessonCount);

  String URL = "https://dart.dev/guides/language/effective-dart#summary-of-all-rules";
  print("Go to [${URL}] for more information.");


//  ------------------------------------------------------------
//  | 17. Dart - Coding Style and Naming Convention            |
//  ------------------------------------------------------------
//  Go to [https://dart.dev/guides/language/effective-dart#summary-of-all-rules] for more information.


  // =========================================================================
  // 18. Dart - Declaring variables - String
  lessonTitle = "Dart - Declaring variables - String";
  lessonCount = printLessonTitle(lessonTitle, count: lessonCount);

  print("Printing string...");
  print('Hello world');

  printBreakLines();

  // - Variable = spot in memory. Or just a bucket to hold a value.
  var countryLesson18 = "Malaysia"; // String
  print("Printing from generic variable...");
  print("country (var): $countryLesson18");


//  ------------------------------------------------------------
//  | 18. Dart - Declaring variables - String                  |
//  ------------------------------------------------------------
//  Printing string...
//  Hello world
//  #
//  Printing from generic variable...
//  country (var): Malaysia


  // =========================================================================
  // 19. Dart Types and Assigning Types to Variables
  lessonTitle = "Dart Types and Assigning Types to Variables";
  lessonCount = printLessonTitle(lessonTitle, count: lessonCount);

  // - Type??
  /*
  * String
  * Number (integers and doubles)
  * Boolean: 1 or 0, true or false
  * Lists
  * Maps
  * ... */

  // There are 2 methods to define a variable.

  // Method 1 - Direct assignment (generic type)
  // Assign values of different types to any variable, for example:
  // var country = 1  // [country] becomes Number (integers or doubles)

  // Method 2 - Two-step assignment
  String nameLesson19; // Explicit type declaration
  nameLesson19 = "Darren"; // valid: [name] only accepts String values.
//  name = 1; // invalid: [name] cannot accept num values.

  print("Printing from string variable...");
  print("name (string): $nameLesson19");


//  ------------------------------------------------------------
//  | 19. Dart Types and Assigning Types to Variables          |
//  ------------------------------------------------------------
//  Printing from string variable...
//  name (string): Darren


  // =========================================================================
  // 20. Dart - Numbers - Integers and Doubles
  lessonTitle = "Dart - Numbers - Integers and Doubles";
  lessonCount = printLessonTitle(lessonTitle, count: lessonCount);

  // Integers are numbers without a decimal point. 1, 2, 3, 5, 10, etc.
  // Doubles do have a decimal point, 1.1, 0.2, etc.

  num ageLesson20 = 13;
//  var age = 13; // alternative
  print("age (num): $ageLesson20");

  printBreakLines();

  num numberLesson20 = 23;
  print("number (num): $numberLesson20");

  printBreakLines();

  int ageIntLesson20 = 13;
  double numberDoubleLesson20 = 23.34;

  print("age (int): $ageIntLesson20");
  print("number (double): $numberDoubleLesson20");


//  ------------------------------------------------------------
//  | 20. Dart - Numbers - Integers and Doubles                |
//  ------------------------------------------------------------
//  age (num): 13
//  #
//  number (num): 23
//  #
//  age (int): 13
//  number (double): 23.34


  // =========================================================================
  // 21. Dart - Booleans
  lessonTitle = "Dart - Booleans";
  lessonCount = printLessonTitle(lessonTitle, count: lessonCount);

  // Boolean type makes more sense in Control flow.
  bool isTrueLesson21 = true;
  bool isFalseLesson21 = false;

  print("Printing isTrue: $isTrueLesson21");
  print("Printing isFalse: $isFalseLesson21");


//  ------------------------------------------------------------
//  | 21. Dart - Booleans                                      |
//  ------------------------------------------------------------
//  Printing isTrue: true
//  Printing isFalse: false


  // =========================================================================
  // 22. Dart - Const and Final Keywords
  lessonTitle = "Dart - Const and Final Keywords";
  lessonCount = printLessonTitle(lessonTitle, count: lessonCount);

  // Const and final keywords - efficiency benefits.
  //
  // Const: used when we want the value/variable to be constant at compile time.
  // Final: used when we want a value/variable to always be constant
  // - never changes.

//  var countryLesson22 = "Jamaica";

  // In some cases, we need a constant value.
  //
  // This value does not change over time, for example: pi.
  var piVarLesson22 = 3.14;
  piVarLesson22 = 23.89; // Valid
  print("piVar: $piVarLesson22");

  const piConstantLesson22 = 3.14;
//  piConstantLesson22= 34.56; // Invalid: Constant variables can't be assigned a value.
  print("piConstant: $piConstantLesson22");

  final piFinalLesson22 = 3.14;
//  piFinalLesson22= 3.56; // Invalid: Final variable [piFinal] can only be set once.
  print("piFinal: $piFinalLesson22");


//  ------------------------------------------------------------
//  | 22. Dart - Const and Final Keywords                      |
//  ------------------------------------------------------------
//  piVar: 23.89
//  piConstant: 3.14
//  piFinal: 3.14


  // =========================================================================
  // 23. Dart - Concatenation
  lessonTitle = "Dart - Concatenation";
  lessonCount = printLessonTitle(lessonTitle, count: lessonCount);

  String nameLesson23 = "James";
  String lastNameLesson23 = "Bond";
  int ageLesson23 = 45;

  // Print "James Bond is 45 years old."
  print("$nameLesson23 $lastNameLesson23 is $ageLesson23 years old.");

  // Print "Hello there James Bond."
  print("Hello there $nameLesson23 $lastNameLesson23.");

  // Print "Hello there James BOND."
  print("Hello there $nameLesson23 ${lastNameLesson23.toUpperCase()}.");

  // Print "Hello there James Bond.toUpperCase()."
  //
  // Must add {} to access object/variable properties/methods.
  print("Hello there $nameLesson23 $lastNameLesson23.toUpperCase().");


//  ------------------------------------------------------------
//  | 23. Dart - Concatenation                                 |
//  ------------------------------------------------------------
//  James Bond is 45 years old.
//  Hello there James Bond.
//  Hello there James BOND.
//  Hello there James Bond.toUpperCase().


  // =========================================================================
  // 24. Dart - Arithmetic
  lessonTitle = "Dart - Arithmetic";
  lessonCount = printLessonTitle(lessonTitle, count: lessonCount);

  // Arithmetic Operators: + - * / % (remainder).
  //
  // Remainder: "what remains from a division operation?"
  // E.g.: 4/2 => remainder?

  int numberLesson24 = 34;
  int numberTwoLesson24 = 2;
  print(numberLesson24 + numberTwoLesson24);

  print("number: $numberLesson24, numberTwo: $numberTwoLesson24");
  print("> number + numberTwo: ${numberLesson24 + numberTwoLesson24}");

  printBreakLines();

  print("number: $numberLesson24, numberTwo: $numberTwoLesson24");
  print("Arithmetic operation: number <operator> numberTwo");

  var resultLesson24 = numberLesson24 + numberTwoLesson24;
  var resultMinusLesson24 = numberLesson24 - numberTwoLesson24;
  var resultTimesLesson24 = numberLesson24 * numberTwoLesson24;
  var resultDivideLesson24 = numberLesson24 / numberTwoLesson24;

  print("> Plus operator (+): $resultLesson24");
  print("> Minus operator (-): $resultMinusLesson24");
  print("> Times operator (*): $resultTimesLesson24");
  print("> Divide operator (/): $resultDivideLesson24");

  // Note: Division between two integer values returns a double value.

  printBreakLines();

  double piLesson24 = 3.14;
  double gravityLesson24 = 9.8;

  print("pi: 3.14, gravity = 9.8");
  print("> pi + gravity: ${piLesson24 + gravityLesson24}");
  print("> pi - gravity: ${piLesson24 - gravityLesson24}");

  printBreakLines();

  print("Remainder:");
  print("4%2: ${4%2}");
  print("4%3: ${4%3}");


//  ------------------------------------------------------------
//  | 24. Dart - Arithmetic                                    |
//  ------------------------------------------------------------
//  36
//  number: 34, numberTwo: 2
//  > number + numberTwo: 36
//  #
//  number: 34, numberTwo: 2
//  Arithmetic operation: number <operator> numberTwo
//  > Plus operator (+): 36
//  > Minus operator (-): 32
//  > Times operator (*): 68
//  > Divide operator (/): 17.0
//  #
//  pi: 3.14, gravity = 9.8
//  > pi + gravity: 12.940000000000001
//  > pi - gravity: -6.66
//  #
//  Remainder:
//  4%2: 0
//  4%3: 1


  // =========================================================================
  // 25. Equality and Relational Operators in Dart
  lessonTitle = "Equality and Relational Operators in Dart";
  lessonCount = printLessonTitle(lessonTitle, count: lessonCount);

  // Equality and Relational Operators: == != > < >= <=
  //
  // Used to look for relation between two things - comparision.
  // Helpful in control flow - true or false - decision making.

//  int numberLesson25 = 34;

  print("4 == 2: ${4 == 2}"); // returns Boolean value

  printBreakLines();

  double piLesson25 = 3.14;
  double gravityLesson25 = 9.8;

  print("pi: $piLesson25, gravity: $gravityLesson25");
  print("> pi == gravity: ${piLesson25 == gravityLesson25}");
  print("> pi == pi: ${piLesson25 == piLesson25}");
  print("> pi != pi: ${piLesson25 != piLesson25}");
  print("> pi > gravity: ${piLesson25 > gravityLesson25}");
  print("> pi < gravity: ${piLesson25 < gravityLesson25}");
  print("> pi >= gravity: ${piLesson25 >= gravityLesson25}");
  print("> pi <= gravity: ${piLesson25 <= gravityLesson25}");


//  ------------------------------------------------------------
//  | 25. Equality and Relational Operators in Dart            |
//  ------------------------------------------------------------
//  4 == 2: false
//  #
//  pi: 3.14, gravity: 9.8
//  > pi == gravity: false
//  > pi == pi: true
//  > pi != pi: false
//  > pi > gravity: false
//  > pi < gravity: true
//  > pi >= gravity: false
//  > pi <= gravity: true


}