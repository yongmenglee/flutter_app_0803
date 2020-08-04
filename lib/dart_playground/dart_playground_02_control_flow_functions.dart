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
  while(numberLesson30 < 34) {
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
  while(conditionLesson30 < 5) {
    outputPrint("Hello world.");
    conditionLesson30++;
  }

  printBreakLines();

  // Method 2: Using break statement
  // While statement is executed, but eventually stop by break statement.
  outputPrint("Printing while loop...");
  while(true) {
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
  // Create output file.
  createOutputFile(filename: "dart_playground_output_02_control_flow_functions");
}
