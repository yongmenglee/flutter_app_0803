// Section 16. APP - Quiz App - Learn More Flutter Widgets

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutterapp0803/flutter_playground_05_quiz/model/question.dart';
import 'package:neumorphic/neumorphic.dart';

class QuizApp extends StatefulWidget {
  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
//  BuildContext _scaffoldContext;

  int _currentQuestionIndex = 0;

  List questionBank = [
    Question.name(
        "The U.S. Declaration of Independence was adopted in 1776.", true),
    Question.name("The The Supreme law of the land is the Constitution.", true),
    Question.name("The (U.S.) Constitution has 26 Amendments.", false),
    Question.name(
        "The two rights in the Declaration of Independence are:"
        "\n Life"
        "\n Pursuit of happiness",
        true),
    Question.name(
        "Freedom of religion means:\nYou can practice any religion, "
        "or not practice a religion.",
        true),
    Question.name("Journalist is one branch or part of the government.", false),
    Question.name("The Congress does not make federal laws.", false),
    Question.name("There are 100 U.S. Senators.", true),
    Question.name("We elect a U.S. Senator for 4 years.", false),
    Question.name("We elect a U.S. Representative for 2 years.", true),
    Question.name(
        "A U.S. Senator represents all people for the United States", false),
    Question.name("We vote for President in January.", false),
    Question.name("Who vetoes bills is the President.", true),
    Question.name("The Constitution was written in 1787.", true),
    Question.name("George Bush is the \"Father of Our Country\".", false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("True Citizen"),
          centerTitle: true,
          backgroundColor: Colors.blueGrey,
        ),
        backgroundColor: Colors.blueGrey,
        body: Container(
          child: ListView(
            scrollDirection: Axis.vertical,
            children: <Widget>[
              // Image
              Center(
                child: Image.asset(
                  "images/flag.png", // must update pubspec.yaml
                  width: 250,
                  height: 180,
                ),
              ),

              // Quiz box
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: NeuCard(
//                  decoration: BoxDecoration(
//                    borderRadius: BorderRadius.circular(14.0),
//                    border: Border.all(
//                      color: Colors.blueGrey.shade400,
//                      style: BorderStyle.solid,
//                    ),
//                  ),

                  curveType: CurveType.flat,
                  bevel: 12.0,
                  color: Colors.blueGrey,
                  height: 150.0,
                  child: Center(
                    child: Padding(
//                      padding: const EdgeInsets.all(8.0),
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 12.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Question ${_currentQuestionIndex + 1}",
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.blueGrey,
//                              fontWeight: FontWeight.bold,
                              shadows: [
                                Shadow(
                                  color: Colors.blueGrey.shade800,
                                  offset: Offset(2.0, 2.0),
                                  blurRadius: 3.0,
                                ),
                                Shadow(
                                  color: Colors.blueGrey.shade400,
                                  offset: Offset(-2.0, -2.0),
                                  blurRadius: 3.0,
                                ),
                              ],
                            ),
                          ),
                          Text(
                            "\n${questionBank[_currentQuestionIndex].questionText}",
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.white,
                              shadows: [
                                Shadow(
                                  color: Colors.blueGrey.shade900,
                                  offset: Offset(2.0, 2.0),
                                  blurRadius: 5.0,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
//                child: Container(
//                ),
              ),

              // Buttons
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
//                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    // PREVIOUS button
                    ButtonTheme(
                      minWidth: 40.0,
                      child: RaisedButton(
                        onPressed: () => _prevQuestion(),
                        color: Colors.blueGrey.shade800,
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                    ),

                    // TRUE button
                    Builder(
                      // We wrap the button in a build widget to enable
                      // showing snack bar on button pressed.
                      builder: (context) => RaisedButton(
                        onPressed: () => _checkAnswer(true, context),
                        color: Colors.blueGrey.shade900,
                        child: Text(
                          "TRUE",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),

                    // FALSE button
                    Builder(
                      builder: (context) => RaisedButton(
                        onPressed: () => _checkAnswer(false, context),
                        color: Colors.blueGrey.shade900,
                        child: Text(
                          "FALSE",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),

                    // NEXT button
                    ButtonTheme(
                      minWidth: 40.0,
                      child: RaisedButton(
                        onPressed: () => _nextQuestion(),
                        color: Colors.blueGrey.shade800,
                        child: Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  _checkAnswer(bool selectedAnswer, BuildContext context) {
    Question _currentQuestion = questionBank[_currentQuestionIndex];
    bool _isSelectedAnswerCorrect =
        _currentQuestion.isCorrect == selectedAnswer;
    Color _colorScaffold = _isSelectedAnswerCorrect ? Colors.green : Colors.red;
    String _txtScaffold = _isSelectedAnswerCorrect
        ? "Yes, your answer is correct! 🎉"
        : "Incorrect! 😢";

    final snackBar = SnackBar(
      content: Text(_txtScaffold, textAlign: TextAlign.center),
      backgroundColor: _colorScaffold.withOpacity(0.7),
      duration: Duration(milliseconds: 1500),
    );

    setState(() {
      Scaffold.of(context).showSnackBar(snackBar);
      _nextQuestion();
    });
  }

  _nextQuestion() {
    setState(() {
      int numQuestions = questionBank.length;
      _currentQuestionIndex = (_currentQuestionIndex + 1) % numQuestions;
    });
  }

  _prevQuestion() {
    setState(() {
      int numQuestions = questionBank.length;
      _currentQuestionIndex = (_currentQuestionIndex - 1) % numQuestions;
    });
  }
}
