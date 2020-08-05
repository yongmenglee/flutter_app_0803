// Section 8: Object Oriented Programming - Introduction

// Import helper functions
import 'dart_playground_00_helper.dart';

// Class is a blueprint
class MicrophoneLesson41 {
  // Instance variables, member variables
  String name;
  String color; // not initialized
  int model = 4536; // initialized

  // Lesson 43: Constructor Part 1
  // ---
  // Constructor in parent class.
  // [] means optional.
  // Lesson 44: Syntactic sugar constructor :)
  MicrophoneLesson41([this.name, this.color, this.model]);

//  // Alternative way: not encouraged!
//  MicrophoneLesson41([String name, String color, int model]) {
//    this.name = name;
//    this.color = color;
//    this.model = model;
//  }

  // Lesson 44: Named constructor Part 2
  // ---
  MicrophoneLesson41.initialize() {
    name = "Blue Yeti 2nd Edition";
    model = 67;
  }

  // Lesson 45: Getters and Setters
  // ---
  // Getter: name
  String get getName => name;
  // Setter: name
  set setName(String value) => this.name = value;

  // Temporary
  MicrophoneLesson41 copy(MicrophoneLesson41 oldMic) {
    var newMic = new MicrophoneLesson41();

    newMic.name = oldMic.name;
    newMic.color = oldMic.color;
    newMic.model = oldMic.model;

    return newMic;
  }
}

// ---------------------------------------------------------------------------

class MicrophoneLesson42 extends MicrophoneLesson41 {
  // Lesson 43
  // ---
  // Constructor in subclass.
  MicrophoneLesson42([String name, String color, int model])
      : super(name, color, model);

  // Lesson 44
  // ---
  // Named constructor in subclass
  MicrophoneLesson42.initialize() : super.initialize();

  // Methods
  void turnOn() {
    outputPrint("$name is on!");
  }

  void turnOff() {
    outputPrint("$name is turned off!");
  }

  void setVolume() {
    outputPrint("$name with color: $color volume is up!");
  }

  bool isOn() => true;

  int modelNumber() => model;

  // Temporary
  @override
  MicrophoneLesson42 copy(MicrophoneLesson41 oldMic) {
    var newMic = new MicrophoneLesson42();

    newMic.name = oldMic.name;
    newMic.color = oldMic.color;
    newMic.model = oldMic.model;

    return newMic;
  }
}

// ---------------------------------------------------------------------------

class MicrophoneLesson43 extends MicrophoneLesson42 {
// Lesson 43
// ---
// Constructor in subclass.
  MicrophoneLesson43([String name, String color, int model])
      : super(name, color, model);

  // Lesson 44
  // ---
  // Named constructor in subclass
  MicrophoneLesson43.initialize() : super.initialize();
}

// ---------------------------------------------------------------------------

class MicrophoneLesson44 extends MicrophoneLesson42 {
  // Lesson 43
  // ---
  // Constructor in subclass.
  MicrophoneLesson44([String name, String color, int model])
      : super(name, color, model);

  // Lesson 44
  // ---
  // Named constructor in subclass
  MicrophoneLesson44.initialize() : super.initialize();
}

// ---------------------------------------------------------------------------

class MicrophoneLesson45 extends MicrophoneLesson42 {
  // Setter
  set setName(String value) => this.name = value;
  // Getter
  String get getName => this.name;

  @override
  MicrophoneLesson45 copy(MicrophoneLesson41 oldMic) {
    var newMic = new MicrophoneLesson45();

    newMic.name = oldMic.name;
    newMic.color = oldMic.color;
    newMic.model = oldMic.model;

    return newMic;
  }
}

// ---------------------------------------------------------------------------

void main() {
  int lessonCount = 0;
  String lessonTitle = "";

  // =========================================================================
  // 40. Introduction to Classes and Objects
  lessonTitle = "Introduction to Classes and Objects";
  lessonCount = printLessonTitle(lessonTitle, count: 40);

  // Classes and Objects
  // ---
  // Class: The blueprint => Object: The actual microphone
  //
  // Class can be used as many time as you wish.
  // Class: a templete (blueprint) for creating objects (the real thing)
  //
  // Classes Anatomy
  // ---
  // - Properties or attributes
  // - Methods
  // Objects will have those properties and methods tool.

  outputPrint("General concepts about OOP...");

//  ------------------------------------------------------------
//  | 40. Introduction to Classes and Objects                  |
//  ------------------------------------------------------------
//  General concepts about OOP...

  // =========================================================================
  // 41. Introduction to Class Creation and Instance Variables
  lessonTitle = "Introduction to Class Creation and Instance Variables";
  lessonCount = printLessonTitle(lessonTitle, count: lessonCount);

  // Create the actual object of type MicrophoneLesson41
  // (or instantiating the object)
  var micLesson41 = new MicrophoneLesson41();
  micLesson41.name = "Blue Yeti";
  micLesson41.color = "Silver Grey";

  outputPrint("mic: $micLesson41");
  outputPrint("mic.name: ${micLesson41.name}"); // access operator
  outputPrint(
      "mic.model (initialized): ${micLesson41.model}"); // access operator

  printBreakLines();

  micLesson41.model = 1345;
  outputPrint("mic.model (updated): ${micLesson41.model}"); // access operator

//  ------------------------------------------------------------
//  | 41. Introduction to Class Creation and Instance Varia... |
//  ------------------------------------------------------------
//  mic: Instance of 'MicrophoneLesson41'
//  mic.name: Blue Yeti
//  mic.model (initialized): 4536
//  #
//  mic.model (updated): 1345

  // =========================================================================
  // 42. Adding Methods to Classes
  lessonTitle = "Adding Methods to Classes";
  lessonCount = printLessonTitle(lessonTitle, count: lessonCount);

  var micLesson42 = new MicrophoneLesson42().copy(micLesson41);
  outputPrint(micLesson42.model);

  printBreakLines();

  outputPrint("Calling class methods...");
  micLesson42.turnOn();
  micLesson42.turnOff();
  micLesson42.setVolume();

  printBreakLines();

  outputPrint("Printing return values from class methods...");
  outputPrint(micLesson42.isOn());
  outputPrint(micLesson42.modelNumber());

//  ------------------------------------------------------------
//  | 42. Adding Methods to Classes                            |
//  ------------------------------------------------------------
//  1345
//  #
//  Calling class methods...
//  Blue Yeti is on!
//  Blue Yeti is turned off!
//  Blue Yeti with color: Silver Grey volume is up!
//  #
//  Printing return values from class methods...
//  true
//  1345

  // =========================================================================
  // 43. Introduction to Constructors - Part 1
  lessonTitle = "Introduction to Constructors - Part 1";
  lessonCount = printLessonTitle(lessonTitle, count: lessonCount);

  // Define new mic using constructor, should expect the same output
  // as in Lesson 42.
  MicrophoneLesson43 micLesson43 =
      new MicrophoneLesson43("Blue Yeti", "Silvey Gray", 1345);
  outputPrint(micLesson43.model);

  printBreakLines();

  outputPrint("Calling class methods...");
  micLesson43.turnOn();
  micLesson43.turnOff();
  micLesson43.setVolume();

  printBreakLines();

  outputPrint("Printing return values from class methods...");
  outputPrint(micLesson43.isOn());
  outputPrint(micLesson43.modelNumber());

  printBreakLines();

  outputPrint("Printing overwritten property: model...");
  micLesson43.model = 9848651468;
  outputPrint(micLesson43.model);

//  ------------------------------------------------------------
//  | 43. Introduction to Constructors - Part 1                |
//  ------------------------------------------------------------
//  1345
//  #
//  Calling class methods...
//  Blue Yeti is on!
//  Blue Yeti is turned off!
//  Blue Yeti with color: Silvey Gray volume is up!
//  #
//  Printing return values from class methods...
//  true
//  1345
//  #
//  Printing overwritten property: model...
//  9848651468

  // =========================================================================
  // 44. Named and Suger Syntactic Constructors - Part 2
  lessonTitle = "Named and Suger Syntactic Constructors - Part 2";
  lessonCount = printLessonTitle(lessonTitle, count: lessonCount);

  outputPrint("Printing object properties from class with named constructor...");
  var micLesson44 = new MicrophoneLesson44.initialize();
  outputPrint(micLesson44.name);
  outputPrint(micLesson44.model);

//  ------------------------------------------------------------
//  | 44. Named and Suger Syntactic Constructors - Part 2      |
//  ------------------------------------------------------------
//  Printing object properties from class with named constraint...
//  Blue Yeti 2nd Edition
//  67

  // =========================================================================
  // 45. Setter and Getter
  lessonTitle = "Setter and Getter";
  lessonCount = printLessonTitle(lessonTitle, count: lessonCount);

  // Dart class has implicitly defined getters and setters.
  var micLesson45 = new MicrophoneLesson45().copy(micLesson43);

  outputPrint("Before setter and getter...");
  outputPrint(micLesson45.name);

  printBreakLines();

  // Setter
  micLesson45.setName = "New Name"; // valid
//  micLesson45.setName("adadf"); // invalid

  // Getter
  outputPrint("After setter and getter...");
  outputPrint(micLesson45.getName);

//  ------------------------------------------------------------
//  | 45. Setter and Getter                                    |
//  ------------------------------------------------------------
//  Before setter and getter...
//  Blue Yeti
//  #
//  After setter and getter...
//  New Name

  // =========================================================================
  // Create output file.
  createOutputFile(filename: "dart_playground_output_03_oop_introduction");
}
