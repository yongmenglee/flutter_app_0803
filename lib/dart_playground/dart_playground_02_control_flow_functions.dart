// Section 7: Control Flow and Functions in Dart

// Import helper functions
import 'dart_playground_00_helper.dart';

void main() {
  int lessonCount = 0;
  String lessonTitle = "";

  // =========================================================================
  // 27. Control Flow - If Statements
  lessonTitle = "Control Flow - If Statements";
  lessonCount = printLessonTitle(lessonTitle, count: 27);

  // Type Test Operator: as is is!
  //
  // Helpful in checking variable type on runtime.

  int numberLesson27 = 34;
  outputPrint("number: [type: ${numberLesson27.runtimeType}, "
      "value: $numberLesson27]");

  outputPrint("Printing type test operators...");
  outputPrint("> number is string: ${numberLesson27 is String}"); // Boolean
  outputPrint("> number is int: ${numberLesson27 is int}"); // Boolean
  outputPrint("> number is bool: ${numberLesson27 is bool}"); // Boolean
  outputPrint("> number is! bool: ${numberLesson27 is! bool}"); // Boolean

  printBreakLines();

  // If statement
  outputPrint("If statement #1: (number == 34)");
  if (numberLesson27 == 34) {
    outputPrint("> If true, this will run!");
  } else {
    outputPrint("> Else running!");
  }

  printBreakLines();

  outputPrint("If statement #2: (number != 34)");
  if (numberLesson27 != 34) {
    outputPrint("> If true, this will run!");
  } else {
    outputPrint("> Else running!");
  }

//  ------------------------------------------------------------
//  | 27. Control Flow - If Statements                         |
//  ------------------------------------------------------------
//  number: [type: int, value: 34]
//  Printing type test operators...
//  > number is string: false
//  > number is int: true
//  > number is bool: false
//  > number is! bool: true
//  #
//  If statement #1: (number == 34)
//  > If true, this will run!
//  #
//  If statement #2: (number != 34)
//  > Else running!

  // =========================================================================
  // 28. Logical Operators
  lessonTitle = "Logical Operators";
  lessonCount = printLessonTitle(lessonTitle, count: lessonCount);

  // Logical Operators: ! || &&
  //
  // !: Negate (NOT) operator
  //
  // ||: Union (OR) operator
  // - Only needs one "side" to be True for the whole expression to be true
  //
  // &&: Intersection (AND) operator
  // - True only if both "side" are True.

  int numberLesson28 = 34;
  String trueStatementLesson28 = "Not a hundred!";
  String falseStatementLesson28 = "Yess!";

  outputPrint("number: $numberLesson28");
  outputPrint("Statements:");
  outputPrint("> True: $trueStatementLesson28");
  outputPrint("> False: $falseStatementLesson28");

  printBreakLines();

  outputPrint("if statement: (number != 100))");
  if (numberLesson28 != 100) {
    outputPrint(trueStatementLesson28); // Print this
  } else {
    outputPrint(falseStatementLesson28);
  }

  printBreakLines();

  // !true => false
  outputPrint("if statement: !(number != 100))");
  if (!(numberLesson28 != 100)) {
    outputPrint(trueStatementLesson28);
  } else {
    outputPrint(falseStatementLesson28); // Print this
  }

  printBreakLines();

  // false OR true => true
  outputPrint("if statement: !(number != 100) || number <= 100)");
  if (!(numberLesson28 != 100) || numberLesson28 <= 100) {
    outputPrint(trueStatementLesson28); // Print this
  } else {
    outputPrint(falseStatementLesson28);
  }

  printBreakLines();

  // false OR false => false
  outputPrint("if statement: !(number != 100) || number >= 100)");
  if (!(numberLesson28 != 100) || numberLesson28 >= 100) {
    outputPrint(trueStatementLesson28);
  } else {
    outputPrint(falseStatementLesson28); // Print this
  }

  printBreakLines();

  // false AND true => false
  outputPrint("if statement: !(number != 100) && number <= 100)");
  if (!(numberLesson28 != 100) && numberLesson28 <= 100) {
    outputPrint(trueStatementLesson28);
  } else {
    outputPrint(falseStatementLesson28); // Print this
  }

//  ------------------------------------------------------------
//  | 28. Logical Operators                                    |
//  ------------------------------------------------------------
//  number: 34
//  Statements:
//  > True: Not a hundred!
//  > False: Yess!
//  #
//  if statement: (number != 100))
//  Not a hundred!
//  #
//  if statement: !(number != 100))
//  Yess!
//  #
//  if statement: !(number != 100) || number <= 100)
//  Not a hundred!
//  #
//  if statement: !(number != 100) || number >= 100)
//  Yess!
//  #
//  if statement: !(number != 100) && number <= 100)
//  Yess!

  // =========================================================================
  // 29. For Loops in Dart
  lessonTitle = "For Loops in Dart";
  lessonCount = printLessonTitle(lessonTitle, count: lessonCount);

  // for loop
  outputPrint("Printing for loop...");
  for (var i = 0; i < 10; i++) {
    outputPrint("Hello $i");
  }

  printBreakLines();

  outputPrint("Printing for loop...");
  outputPrint("> Condition: print only when i is even (i % 2 == 0)");
  for (var i = 0; i < 10; i++) {
    if (i % 2 == 0) {
      outputPrint("Hello $i");
    }
  }

  printBreakLines();

  outputPrint("Printing for loop...");
  outputPrint("> Condition: print only when i is divisible by 3 (i % 3 == 0)");
  var mangoLesson29 = "Mango";
  for (var i = 0; i < 10; i++) {
    if (i % 3 == 0) {
      outputPrint("$mangoLesson29 $i");
    }
  }

//  ------------------------------------------------------------
//  | 29. For Loops in Dart                                    |
//  ------------------------------------------------------------
//  Printing for loop...
//  Hello 0
//  Hello 1
//  Hello 2
//  Hello 3
//  Hello 4
//  Hello 5
//  Hello 6
//  Hello 7
//  Hello 8
//  Hello 9
//  #
//  Printing for loop...
//  > Condition: print only when i is even (i % 2 == 0)
//  Hello 0
//  Hello 2
//  Hello 4
//  Hello 6
//  Hello 8
//  #
//  Printing for loop...
//  > Condition: print only when i is divisible by 3 (i % 3 == 0)
//  Mango 0
//  Mango 3
//  Mango 6
//  Mango 9

  // =========================================================================
  // 30. While, Do-While and Break in Dart
  lessonTitle = "While, Do-While and Break in Dart";
  lessonCount = printLessonTitle(lessonTitle, count: lessonCount);

  // while and do-while loop
  //
  // while loop: might cause infinite loop if not properly defined.
  // do-while loop: similar to while loop, gives a bit more flexibility.

  int numberLesson30 = 34;

  // While statement is not executed, condition is not met.
  outputPrint("Printing while loop...");
  while (numberLesson30 < 34) {
    outputPrint("Hello world.");
  }

  printBreakLines();

  // While statement is always executed, infinite loop!
  // - Should prevent this!
//  outputPrint("Printing while loop...");
//  while(true) {
//    outputPrint("Going...");
//  }
//
//  printBreakLines();

  // Two methods to prevent infinite while loop
  // Method 1: Update the variable for condition checking.
  // While statement is executed, but eventually stop when condition is
  // no longer met.
  outputPrint("Printing while loop...");
  int conditionLesson30 = 0;
  while (conditionLesson30 < 5) {
    outputPrint("Hello world.");
    conditionLesson30++;
  }

  printBreakLines();

  // Method 2: Using break statement
  // While statement is executed, but eventually stop by break statement.
  outputPrint("Printing while loop...");
  while (true) {
    outputPrint("Hello world.");
    break;

    // Anything after the break statement is considered as Dead code.
  }

  printBreakLines();

  // Do-while loop is always executed once without checking the condition.
  outputPrint("Printing do-while loop...");
  do {
    outputPrint("Hello world");
  } while (numberLesson30 < 34);

//  ------------------------------------------------------------
//  | 30. While, Do-While and Break in Dart                    |
//  ------------------------------------------------------------
//  Printing while loop...
//  #
//  Printing while loop...
//  Hello world.
//  Hello world.
//  Hello world.
//  Hello world.
//  Hello world.
//  #
//  Printing while loop...
//  Hello world.
//  #
//  Printing do-while loop...
//  Hello world

  // =========================================================================
  // 31. Switch Cases
  lessonTitle = "Switch Cases";
  lessonCount = printLessonTitle(lessonTitle, count: lessonCount);

  // Switch case: If statement, not maintainable with increasing number of
  // conditions.
  var ageLesson31 = 18;

  outputPrint("age: $ageLesson31");
  outputPrint("Printing switch statement...");
  switch (ageLesson31) {
    case 19:
      outputPrint("Old enough!");
      break;
    case 20:
      outputPrint("Still good");
      break;
    case 89:
      outputPrint("Too old");
      break;
    default:
      outputPrint("Default $ageLesson31"); // Print this.
  }

//  ------------------------------------------------------------
//  | 31. Switch Cases                                         |
//  ------------------------------------------------------------
//  age: 18
//  Printing switch statement...
//  Default 18

  // =========================================================================
  // 32. Introduction to Function in Dart
  lessonTitle = "Introduction to Function in Dart";
  lessonCount = printLessonTitle(lessonTitle, count: lessonCount);

  doSomethingLesson32();

//  ------------------------------------------------------------
//  | 32. Introduction to Function in Dart                     |
//  ------------------------------------------------------------
//  Hello functions!
//  Minho
//  Hooray!

  // =========================================================================
  // 33. Function Return Types - String-Int-Booleans
  lessonTitle = "Function Return Types - String-Int-Booleans";
  lessonCount = printLessonTitle(lessonTitle, count: lessonCount);

  // Function definition without keyword => void - no return value
  // Example: doSomethingLesson32() == void doSomethingLesson32()

  var nameLesson33 = showNameLesson33();
  var ageLesson33 = showAgeLesson33();

  outputPrint(nameLesson33);
  outputPrint(showNameLesson33());
  outputPrint("Hello ${showNameLesson33()}");
  outputPrint("Hello ${doSomethingLesson32()}"); // without return value

  outputPrint("Hello ${showNameLesson33()} ${showAgeLesson33()}");
  outputPrint("Hello ${showNameLesson33()} $ageLesson33");

  outputPrint("Is it true? ${isKnowLesson33()}");

//  ------------------------------------------------------------
//  | 33. Function Return Types - String-Int-Booleans          |
//  ------------------------------------------------------------
//  Hello from showName!
//  Hello from showName!
//  Hello Hello from showName!
//  Hello functions!
//  Minho
//  Hooray!
//  Hello null
//  Hello Hello from showName! 34
//  Hello Hello from showName! 34
//  Is it true? true

  // =========================================================================
  // 34. Dart - Using the => Operator for Returning Expressions
  lessonTitle = "Dart - Using the => Operator for Returning Expressions";
  lessonCount = printLessonTitle(lessonTitle, count: lessonCount);

  // Emerging programming languages: minimalistic way to define a function.
  outputPrint("Printing function with => opeator...");
  outputPrint("getName(): ${getNameLesson34()}");
  outputPrint("showAgeNow(): ${showAgeNowLesson34()}");

//  ------------------------------------------------------------
//  | 34. Dart - Using the => Operator for Returning Expres... |
//  ------------------------------------------------------------
//  Printing function with => opeator...
//  getName(): James Bond
//  showAgeNow(): 34

  // =========================================================================
  // 35. Arguments and Functions in Dart
  lessonTitle = "Arguments and Functions in Dart";
  lessonCount = printLessonTitle(lessonTitle, count: lessonCount);

  outputPrint("Printing from function with one argument...");
  outputPrint(sayHelloLesson35("Minho"));
  outputPrint(sayHelloLesson35("James Bond"));

  var nameLesson35 = sayHelloLesson35("George");
  outputPrint(nameLesson35);

  printBreakLines();

  var nameV2Lesson35 = sayHelloV2Lesson35("George");
  outputPrint("Printing from minimalized function with one argument...");
  outputPrint(nameV2Lesson35);

  printBreakLines();

  var nameV3Lesson35 = sayHelloV3Lesson35("George", "Kealy", 74);
  outputPrint("Printing from minimalized function with multiple argument...");
  outputPrint(nameV3Lesson35);

//  ------------------------------------------------------------
//  | 35. Arguments and Functions in Dart                      |
//  ------------------------------------------------------------
//  Printing from function with one argument...
//  Hello Minho
//  Hello James Bond
//  Hello George
//  #
//  Printing from minimalized function with one argument...
//  Hello George
//  #
//  Printing from minimalized function with multiple argument...
//  Hello George Kealy 74 years old.

  // =========================================================================
  // 36. Optional Parameters in Dart
  lessonTitle = "Optional Parameters in Dart";
  lessonCount = printLessonTitle(lessonTitle, count: lessonCount);

  outputPrint("Age not specified...");
  outputPrint(yourAgeLesson36("Nina", "Hey"));

  printBreakLines();

  outputPrint("Age specified...");
  outputPrint(yourAgeLesson36("Nina", "Hey", 34));

//  ------------------------------------------------------------
//  | 36. Optional Parameters in Dart                          |
//  ------------------------------------------------------------
//  Age not specified...
//  Nina Hey
//  #
//  Age specified...
//  Nina Hey is 34 years old.

  // =========================================================================
  // 37. Lexical Scope in Dart
  lessonTitle = "Lexical Scope in Dart";
  lessonCount = printLessonTitle(lessonTitle, count: lessonCount);

  // Function within function
  insideFunctionLesson37() {
    // local variable
    var agentName = "Bond";

    // local function
    innerFunctionLesson37() {
      outputPrint("> Current level: innerFunction");
      outputPrint(myOutsideVarLesson37); // valid
      outputPrint(agentName); // valid
    }

    outputPrint("> Current level: insideFunction");
    outputPrint(myOutsideVarLesson37); // valid
    outputPrint(agentName); // valid

    innerFunctionLesson37(); // valid
  }

  outputPrint("> Current level: main");
  outputPrint(myOutsideVarLesson37); // valid
//  outputPrint(agentName); // invalid

  insideFunctionLesson37(); // valid
//  innerFunctionLesson37(); // invalid

  // Key takeaway: Make sure that the variable that will be used throughout
  // the whole file is declared outside of any function.

//  ------------------------------------------------------------
//  | 37. Lexical Scope in Dart                                |
//  ------------------------------------------------------------
//  > Current level: main
//  Outside var
//  > Current level: insideFunction
//  Outside var
//  Bond
//  > Current level: innerFunction
//  Outside var
//  Bond

  // =========================================================================
  // Create output file.
  createOutputFile(
      filename: "dart_playground_output_02_control_flow_functions");
}

// ---------------------------------------------------------------------------
// Lesson 32
// ---
doSomethingLesson32() {
  outputPrint("Hello functions!");
  sayMyNameLesson32();
}

sayMyNameLesson32() {
  outputPrint("Minho");
  var nameLesson32 = "Minho";
  if (nameLesson32.contains("M")) {
    outputPrint("Hooray!");
  } else {
    outputPrint("Nay!");
  }
}

// ---------------------------------------------------------------------------
// Lesson 33
// ---
String showNameLesson33() {
  return "Hello from showName!";
}

int showAgeLesson33() {
  return 34;
}

bool isKnowLesson33() {
  var age = 67;

  if (age > 4) {
    return true;
  } else {
    return false;
  }
}

// ---------------------------------------------------------------------------
// Lesson 34
// ---
String getNameLesson34() => "James Bond"; // => expr == {return expression; }

int showAgeNowLesson34() => 34;

// ---------------------------------------------------------------------------
// Lesson 35
// ---
String sayHelloLesson35(String name) {
  return "Hello $name";
}

String sayHelloV2Lesson35(String name) => "Hello $name";

String sayHelloV3Lesson35(String name, String lastname, int age) =>
    "Hello $name $lastname $age years old.";

// ---------------------------------------------------------------------------
// Lesson 36
// ---
String yourAgeLesson36(String name, String lastname, [int age]) {
  var finalResult = "$name $lastname";

  if (age != null) {
    finalResult = "$finalResult is $age years old.";
  }

  return finalResult;
}

// ---------------------------------------------------------------------------
// Lesson 37
var myOutsideVarLesson37 = "Outside var"; // Global variable