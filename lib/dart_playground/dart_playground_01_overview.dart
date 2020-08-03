// Section 6: Introduction to the Dart Programming Language - From Scratch

// Main method - everything enclosed within is being called
// - something happens
void main() { // entry point for execution
  print('Hello world');

  print('*'*3);

  // 16. Intro to Dart and Dart Pad - Online Editor
  var a = "Darren";
  var b = "Green";

  print(a);
  print(a+b);

  print('*'*3);

  for (int i = 0; i < 5; i++) {
    print('Hello ${i+1}');
  }

  print('*'*3);


  // =========================================================================

  // 17. Dart - Coding Style and Naming Convention
  // Naming Convention: https://dart.dev/guides/language/effective-dart#summary-of-all-rules


  // =========================================================================

  // 18. Dart - Declaring variables - String
  print('Hello world');

  print('*'*3);

  // - Variable = spot in memory. Or just a bucket to hold a value.
  var country = "Malaysia"; // String
  print(country);

  print('*'*3);


  // =========================================================================

  // 19. Dart Types and Assigning Types to Variables

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

  print('*'*3);


  // =========================================================================

  // 20. Dart - Numbers - Integers and Doubles
  num age = 13;
//  var age = 13; // alternative
  print(age);

  print('*'*3);

  num number = 23;
  print(number);

  print('*'*3);

  // Integers are numbers without a decimal point. 1, 2, 3, 5, 10, etc.
  // Doubles do have a decimal point, 1.1, 0.2, etc.

  int ageInt = 13;
  double numberDouble = 23.34;

  print(numberDouble);

  print('*'*3);

  
  // =========================================================================
}