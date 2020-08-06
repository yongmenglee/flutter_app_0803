// Section 11: Data Structures and Collections in Dart

// Import helper functions
import 'dart_playground_00_helper.dart';

//region Classes
class PersonLesson58 {
  String name;
  PersonLesson58(this.name);
}
//endregion

void main() {
  int lessonCount = 0;
  String lessonTitle = "";

  // =========================================================================
  //region 56. Introduction to Collections
  lessonTitle = "Introduction to Collections";
  lessonCount = printLessonTitle(lessonTitle, count: 56);

  /*
  * # Collection in Dart
  *
  * 1. Variables: hold values (one value at a time).
  * - How about holding more values?
  * - Collections (list - array, Maps - dictionary)
  *
  * ## Lists in Dart - array
  * List = ordered group of values or objects
  * - same data type
  * - index starts from 0
  * - delimited by comma (,)
  *
  * E.g.:
  * [12, 1, 9, 9],
  * ["Hey", "Now"]
  *
  * ## Maps in Dart - dictionary
  * - Key-Value pair
  *
  * E.g.:
  * {"first": "James", "Second": "Bond"}
  * {1: "James", 2: "Bond"}
  *
  * */

  outputPrint("General concepts about collections in Dart...");

//  ------------------------------------------------------------
//  | 56. Introduction to Collections                          |
//  ------------------------------------------------------------
//  General concepts about collections in Dart...

  //endregion

  // =========================================================================
  //region 57. Creating Lists and Iterating through Them
  lessonTitle = "Creating Lists and Iterating through Them";
  lessonCount = printLessonTitle(lessonTitle, count: lessonCount);

  // Define list
  var listLesson57 = [10, 2, 13, 24, 10, 56];

  // Print list properties
  outputPrint("First item: ${listLesson57[0]}");
  outputPrint("Length (# of items): ${listLesson57.length}");
  outputPrint("Last item: ${listLesson57[listLesson57.length - 1]}");

  printBreakLines();

  // For loop
  outputPrint("List iteration using for loop...");
  for (int i = 0; i < listLesson57.length; i++) {
    outputPrint("> Index $i contains ${listLesson57[i]}.");
  }

  printBreakLines();

  // Foreach
  // asMap(): equivalent to enumerate in Python.
  outputPrint("List iteration using foreach...");
  listLesson57.asMap().forEach((i, element) {
    String printString = "> Index $i contains $element.";
    if (element % 2 == 0) {
      printString += " $element is even.";
    } else {
      printString += " $element is odd.";
    }
    outputPrint(printString);
  });

//  ------------------------------------------------------------
//  | 57. Creating Lists and Iterating through Them            |
//  ------------------------------------------------------------
//  First item: 10
//  Length (# of items): 6
//  Last item: 56
//  #
//  List iteration using for loop...
//  > Index 0 contains 10.
//  > Index 1 contains 2.
//  > Index 2 contains 13.
//  > Index 3 contains 24.
//  > Index 4 contains 10.
//  > Index 5 contains 56.
//  #
//  List iteration using foreach...
//  > Index 0 contains 10. 10 is even.
//  > Index 1 contains 2. 2 is even.
//  > Index 2 contains 13. 13 is odd.
//  > Index 3 contains 24. 24 is even.
//  > Index 4 contains 10. 10 is even.
//  > Index 5 contains 56. 56 is even.
//
//  (Last updated: 2020-08-06 16:36:49)
//
//  Process finished with exit code 0

  //endregion

  // =========================================================================
  //region 58. Creating a List with a Person Type Object
  lessonTitle = "Creating a List with a Person Type Object";
  lessonCount = printLessonTitle(lessonTitle, count: lessonCount);

  // Define new object of class List<String>
  var listOfStringsLesson58 = new List<String>();

  listOfStringsLesson58.add("Minho");
  listOfStringsLesson58.add("Kwang Soo");

  listOfStringsLesson58.forEach((element) {
    outputPrint(element);
  });

  printBreakLines();

  // Define new List object to hold list of persons.
  var listOfPersonLesson58 = List<PersonLesson58>();

  // Add persons to the list.
  listOfPersonLesson58.add(PersonLesson58("James"));
  listOfPersonLesson58.add(PersonLesson58("Sheila"));
  listOfPersonLesson58.add(PersonLesson58("Gloria"));
  listOfPersonLesson58.add(PersonLesson58("Gina"));

  // Iterate through list of persons.
  listOfPersonLesson58.forEach((element) {
    outputPrint(element.name);
  });

//  ------------------------------------------------------------
//  | 58. Creating a List with a Person Type Object            |
//  ------------------------------------------------------------
//  Minho
//  Kwang Soo
//  #
//  James
//  Sheila
//  Gloria
//  Gina

  //endregion

  // =========================================================================
  //region 59. Introduction to Maps
  lessonTitle = "Introduction to Maps";
  lessonCount = printLessonTitle(lessonTitle, count: lessonCount);

  // Define new Maps
  var winnersLesson59 = {"first": "Bill", "second": "George", "third": "Bond"};
  var winnerSecondLesson59 = {1: "Apollo", 2: "Something", 3: "Another"};
  var winnerThirdLesson59 = {"Winter": 3, "Autumn": 1, "Spring": 4};

  // Access value by specifying key.
  outputPrint("The first runner-up is ${winnersLesson59["second"]}");

  printBreakLines();

  // Iterate through Maps
  winnersLesson59.forEach((key, value) => outputPrint(key));

  winnerSecondLesson59.forEach((key, value) {
    outputPrint("Prize #$key goes to $value.");
  });

  winnerThirdLesson59.forEach((key, value) {
    outputPrint("Key: $key, value: $value");
  });

  // Convert Map to List
  var listFromMapLesson59 = winnerThirdLesson59
      .map((key, value) => MapEntry(key, "$value for $key"))
      .values
      .toList();

//  listFromMapLesson59.sort((a, b) => a.compareTo(b));
  listFromMapLesson59.sort((a, b) => a.reverseCompareTo(b));
  print(listFromMapLesson59);

  printBreakLines();

  // Print keys and values
  outputPrint(winnersLesson59.keys);
  outputPrint(winnersLesson59.values);

//  ------------------------------------------------------------
//  | 59. Introduction to Maps                                 |
//  ------------------------------------------------------------
//  The first runner-up is George
//  #
//  first
//  second
//  third
//  Prize #1 goes to Apollo.
//  Prize #2 goes to Something.
//  Prize #3 goes to Another.
//  Key: Winter, value: 3
//  Key: Autumn, value: 1
//  Key: Spring, value: 4
//  [4 for Spring, 3 for Winter, 1 for Autumn]
//  #
//  (first, second, third)
//  (Bill, George, Bond)

  //endregion

  // =========================================================================
  // Create output file.
  createOutputFile(
      filename: "dart_playground_output_06_data_structures_collection");
}

//region Extensions
extension reverseSort on String {
  int reverseCompareTo(String b) => this.compareTo(b) * -1;

  // Note: think of "this" the same as "self" in Swift.
}
//endregion