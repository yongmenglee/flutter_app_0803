// Section 9: Object Oriented Programming - Intermediate - Inheritance Concepts

// Import helper functions
import 'dart_playground_00_helper.dart';

abstract class Profession {
  String profession;
  void showProfession() {}
}

abstract class PlayGuitar {
  bool playGuitar;
}

abstract class SayHello {
  void sayHello() {}
}

abstract class Elevation {
  num elevation;
}

// ---------------------------------------------------------------------------

// Lesson 48
class PersonLesson48 {
  String name,
      lastName,
      nationality; // Create member variables of same type in one line
  int age;

  void showName() => outputPrint(this.name);
}

// Lesson 48 - Inheritance
class BonniLesson48 extends PersonLesson48 implements Profession {
  String profession;

  @override
  void showProfession() => outputPrint(this.profession);
}

// Lesson 48 - Inheritance
class MinhoLesson48 extends PersonLesson48 implements PlayGuitar {
  bool playGuitar;
}

// Note: "implements" concept is similar to "delegate" in Swift.

// ---------------------------------------------------------------------------

// Lesson 49
class PersonLesson49 extends PersonLesson48 implements SayHello {
  @override
  void sayHello() => outputPrint("Hello!");

  void showNationality() => outputPrint("Nationality: American");
}

class BonniLesson49 extends PersonLesson49 implements Profession {
  String profession;

  @override
  void showProfession() => outputPrint(this.profession);
}

class MinhoLesson49 extends PersonLesson49 implements PlayGuitar {
  bool playGuitar;

  // Lesson 49 - Overriding class method
  @override
  void sayHello() => outputPrint("Annyeong!");

  @override
  void showNationality() => outputPrint("Nationality: South Korean");
}

// ---------------------------------------------------------------------------

// Lesson 50
class LocationLesson50 {
  num lat, lng; // Instance variables/member fields

  // Default constructor
  LocationLesson50([this.lat, this.lng]);

  // Named constructor
  LocationLesson50.create([this.lat, this.lng]);

  static LocationLesson50 copy(LocationLesson50 olcLoc) =>
      new LocationLesson50(olcLoc.lat, olcLoc.lng);
}

class ElevatedLocationLesson50 extends LocationLesson50 implements Elevation {
  // Key takeaway: If default/named constructor is defined in parent class,
  // constructor must be defined in subclass as well.
  num elevation;

//  // Call Location (parent) constructor.
//  ElevatedLocationLesson50(num lat, num lng, this.elevation) : super(lat, lng);

  // Alternative
  ElevatedLocationLesson50([num lat, num lng, this.elevation])
      : super.create(lat, lng);
}

// ---------------------------------------------------------------------------

// Lesson 51
class ElevatedLocationLesson51 extends LocationLesson50 implements Elevation {
  // Attribute
  num elevation;

  // Constructor
  ElevatedLocationLesson51([num lat, num lng, this.elevation])
      : super.create(lat, lng);

  // Setter
  set setElevation(num value) => this.elevation = value;

  // Overriding methods
  @override
  String toString() => "${this.lat}, ${this.lng}, ${this.elevation}";

  static ElevatedLocationLesson51 copy(LocationLesson50 loc) {
    num newElevation;

    // Checking type of class:
    if (loc is ElevatedLocationLesson50) {
      // ElevatedLocationLesson50: only for playground
      newElevation = loc.elevation;
      // ElevatedLocationLesson51: own class
    } else if (loc is ElevatedLocationLesson51) {
      newElevation = loc.elevation;
    }

    return new ElevatedLocationLesson51(loc.lat, loc.lng, newElevation);
  }
}

// ---------------------------------------------------------------------------

void main() {
  int lessonCount = 0;
  String lessonTitle = "";

  // =========================================================================
  // 47. Introduction to Inheritance with Dart
  lessonTitle = "Introduction to Inheritance with Dart";
  lessonCount = printLessonTitle(lessonTitle, count: 47);

  // Inheritance
  // ---
  // inherited characteristics - default - pass something down.
  //
  // Examples
  // ---
  // Parents
  // > You
  //   > Offsprings
  //
  // Animal (general features for all types of animals)
  // > Felines (features specific to felines, not redundant)
  //   > Cats
  //   > Tigers
  // > Person
  //
  // Inheritance and the "Object" Super Class
  // ---
  // Object
  // > Animal (inherit implicitly from Object)
  //   > Felines
  //   ...
  //
  // Everything in Dart is an Object
  // ---
  // Object
  // > String
  // ...

  outputPrint("General concepts about inheritance in OOP...");

//  ------------------------------------------------------------
//  | 47. Introduction to Inheritance with Dart                |
//  ------------------------------------------------------------
//  General concepts about inheritance in OOP...

  // =========================================================================
  // 48. Creating Classes and Inheritance Tree
  lessonTitle = "Creating Classes and Inheritance Tree";
  lessonCount = printLessonTitle(lessonTitle, count: lessonCount);

  var bonniLesson48 = new BonniLesson48();

  outputPrint("Parent class: Person");
  outputPrint("Child class: Bonni, Minho");

  printBreakLines(character: "-", numChar: 3);

  outputPrint("> Printing [Person] from [Bonni]...");
  bonniLesson48.name = "Bonni";
  bonniLesson48.showName();

  outputPrint("> Printing [Bonni]...");
  bonniLesson48.profession = "Ballerina";
  bonniLesson48.showProfession();

  var minhoLesson48 = new MinhoLesson48();
  minhoLesson48.name = "Minho";
  minhoLesson48.age = 32;
  minhoLesson48.playGuitar = true;

  printBreakLines();

  outputPrint("> Printing [Person] and [Minho] from [Minho]...");
  minhoLesson48.showName();
  outputPrint(minhoLesson48.age);

//  ------------------------------------------------------------
//  | 48. Creating Classes and Inheritance Tree                |
//  ------------------------------------------------------------
//  Parent class: Person
//  Child class: Bonni, Minho
//  ---
//  > Printing [Person] from [Bonni]...
//  Bonni
//  > Printing [Bonni]...
//  Ballerina
//  #
//  > Printing [Person] and [Minho] from [Minho]...
//  Minho
//  32

  // =========================================================================
  // 49. Override Methods
  lessonTitle = "Override Methods";
  lessonCount = printLessonTitle(lessonTitle, count: lessonCount);

  outputPrint("> No overriding methods");
  var bonniLesson49 = new BonniLesson49();
  bonniLesson49.sayHello();
  bonniLesson49.showNationality();

  printBreakLines();

  outputPrint("> Overriding methods");
  var minhoLesson49 = new MinhoLesson49();
  minhoLesson49.sayHello();
  minhoLesson49.showNationality();

//  ------------------------------------------------------------
//  | 49. Override Methods                                     |
//  ------------------------------------------------------------
//  > No overriding methods
//  Hello!
//  Nationality: American
//  #
//  > Overriding methods
//  Annyeong!
//  Nationality: South Korean

  // =========================================================================
  // 50. Inheriting Classes with Constructors
  lessonTitle = "Inheriting Classes with Constructors";
  lessonCount = printLessonTitle(lessonTitle, count: lessonCount);

  var elevatedLesson50 = new ElevatedLocationLesson50(23.89, -234.98, 90);
  outputPrint("Location = ${elevatedLesson50.lat}, ${elevatedLesson50.lng}, "
      "${elevatedLesson50.elevation}");

//  ------------------------------------------------------------
//  | 50. Inheriting Classes with Constructors                 |
//  ------------------------------------------------------------
//  Location = 23.89, -234.98, 90

  // =========================================================================
  // 51. The toString() Method - Override
  lessonTitle = "The toString() Method - Override";
  lessonCount = printLessonTitle(lessonTitle, count: lessonCount);

  String nameLesson51 = "Bonni";
  Object objectLesson51 = new Object();

  outputPrint("> toString() is implicitly inherited to Class.");
  outputPrint(nameLesson51.toString());
  outputPrint(objectLesson51.toString());

  printBreakLines();

  var elevatedLesson51 = ElevatedLocationLesson51.copy(elevatedLesson50);
//  elevatedLesson51.setElevation = elevatedLesson50.elevation;

  outputPrint("> Override toString()...");
  outputPrint(elevatedLesson51.toString());

//  ------------------------------------------------------------
//  | 51. The toString() Method - Override                     |
//  ------------------------------------------------------------
//  > toString() is implicitly inherited to Class.
//  Bonni
//  Instance of 'Object'
//  #
//  > Override toString()...
//  23.89, -234.98, 90

  // =========================================================================
  // Create output file.
  createOutputFile(filename: "dart_playground_output_04_oop_inheritance");
}
