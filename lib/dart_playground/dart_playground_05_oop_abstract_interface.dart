// Section 10: Object Oriented Programming - Advanced - Abstract and Interface Concept

// Import helper functions
import 'dart_playground_00_helper.dart';

// Abstract class (Animal) is just an idea
abstract class AnimalLesson54 {
  // abstract class has abstract methods - mould, not concrete.
  void breathe();

  // concrete class
  void makeNoise() {
    outputPrint("Making animal noises!");
  }
}

abstract class IsFunnyLesson54 {
  // abstract class
  void makePeopleLaugh();
}

// Person
// ---
class PersonLesson54 implements AnimalLesson54 {
  String name, nationality;

  PersonLesson54([this.name, this.nationality]);

  // Implicit override
  void breathe() => outputPrint("${this.name} is breathing through nostrils!");
  void makeNoise() => outputPrint("${this.name} is shouting!");
  String toString() => "${this.name}, from ${this.nationality}";
}

// Person > Comedian
// ---
class ComedianLesson54 extends PersonLesson54 implements IsFunnyLesson54 {
  ComedianLesson54([String name, String nationality]) : super(name, nationality);

  // Implicit override
  void makePeopleLaugh() => outputPrint("${this.name} makes people laugh!");
}

// TV show
// ---
class TVShowLesson54 implements IsFunnyLesson54 {
  String name;

  TVShowLesson54([this.name]);

  String get getName => this.name;

  @override
  void makePeopleLaugh() =>
      outputPrint("${this.name} is funny and makes people laugh!");
}

// ---------------------------------------------------------------------------

void main() {
  int lessonCount = 0;
  String lessonTitle = "";

  // =========================================================================
  // 53. Introduction to Abstract and Interface
  lessonTitle = "Introduction to Abstract and Interface";
  lessonCount = printLessonTitle(lessonTitle, count: 53);

  // Animal (class)
  // > Person
  //   > Comedian
  //   > Clown
  //
  // > IsFunny (class)
  //   > Comedian
  //   > Clown
  //
  // Multiple inheritance is not allowed!
  //
  // Exercise: Why multiple inheritance is not a good idea?
  //
  // Interfaces and Abstract Classes
  // ---
  // Animal (class)
  // > Person
  //   > Comedian
  //   > Clown
  //
  // > IsFunny (interface or abstract)
  //
  // Interface
  // ---
  // Common functionality to unrelated classes.
  // E.g.: IsFunny
  // > Comedian
  // > Clown
  // > TVShow
  //
  // Keyword: implement
  //
  // Abstract class
  // ---
  // Not concrete, and idea, a concept, (very) generic... class
  // Representing something, not something!
  //
  // E.g.: Animal (just an idea)
  // > Felines
  //   > Cats
  //   > Tigers
  // > Person
  //   > ...
  // ...

  outputPrint("General concepts about interface and abstractions in OOP...");

  // =========================================================================
  // 54. Abstract and Interface Classes in Dart - Creation
  lessonTitle = "Abstract and Interface Classes in Dart - Creation";
  lessonCount = printLessonTitle(lessonTitle, count: lessonCount);

  // keyboard: interface is not used in Dart!
  // In Dart - every case has an implicit interface.

//  var animalLesson54 = new Animal(); // invalid
  var lisa = new PersonLesson54("Lisa", "Thailand"); // valid
  outputPrint("${lisa.toString()}, is a singer and a great dancer.");
//  outputPrint("${lisa.name} is a singer from ${lisa.nationality}.");
  lisa.breathe();
  lisa.makeNoise();

  printBreakLines();

  var kwangSoo = new ComedianLesson54("Kwang Soo", "South Korea");
  outputPrint("${kwangSoo.toString()}, is a comedian.");
  kwangSoo.breathe();
  kwangSoo.makeNoise();
  kwangSoo.makePeopleLaugh();

  printBreakLines();

  var runningMan = new TVShowLesson54("Running Man");
  outputPrint("${runningMan.getName} is a popular TV show.");
  runningMan.makePeopleLaugh();

//  ------------------------------------------------------------
//  | 54. Abstract and Interface Classes in Dart - Creation    |
//  ------------------------------------------------------------
//  Lisa, from Thailand, is a singer and a great dancer.
//  Lisa is breathing through nostrils!
//  Lisa is shouting!
//  #
//  Kwang Soo, from South Korea, is a comedian.
//  Kwang Soo is breathing through nostrils!
//  Kwang Soo is shouting!
//  Kwang Soo makes people laugh!
//  #
//  Running Man is a popular TV show.
//  Running Man is funny and makes people laugh!

  // =========================================================================
  // Create output file.
  createOutputFile(
      filename: "dart_playground_output_05_oop_abstract_interface");
}
