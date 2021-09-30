// @dart=2.9
import 'package:flutter/material.dart';
import 'package:gladd/LPalpha.dart';
import 'package:gladd/floatingActionButton.dart';
import 'package:gladd/quizpage.dart';
import 'package:gladd/result.dart';
import 'package:flutter/cupertino.dart';


class QuizApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _QuizAppState();
  }
}

class _QuizAppState extends State<QuizApp> {
  final _questions = const [
    {
      'questionText': 'Q1. Find the correct alphabet for the sign given below:',
      'answers': [
        {'text': 'B', 'score': -2},
        {'text': 'C', 'score': -2},
        {'text': 'A', 'score': 10},
        {'text': 'D', 'score': -2},
      ],
    },
    {
      'questionText': 'Q2. Find the correct alphabet for the sign given below:',
      'answers': [
        {'text': 'B', 'score': -2},
        {'text': 'D', 'score': -2},
        {'text': 'A', 'score': -2},
        {'text': 'C', 'score': 10},
      ],
    },
    {
      'questionText': ' Q3. Find the correct Alphabet for the given below',
      'answers': [
        {'text': 'A', 'score': -2},
        {'text': 'G', 'score': 10},
        {'text': 'H', 'score': -2},
        {'text': 'F', 'score': -2},
      ],
    },
    {
      'questionText': 'Q4. Find the correct alphabet for the sign given below:',
      'answers': [
        {'text': 'D', 'score': 10},
        {'text': 'B', 'score': -2},
        {'text': 'E', 'score': -2},
        {'text': 'F', 'score': -2},
      ],
    },
    {
      'questionText': 'Q5. Is the given image is the sign of F ?',
      'answers': [
        {
          'text': 'True',
          'score': -2,
        },
        {'text': 'False', 'score': 10},
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => (Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => LPalpha()),
            )), // button pressed
          ),
          centerTitle: true,
          title: Text('GLADD QUIZ'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: _questionIndex < _questions.length
              ? Quiz(
                  answerQuestion: _answerQuestion,
                  questionIndex: _questionIndex,
                  questions: _questions,
                ) //Quiz
              : Result(_totalScore, _resetQuiz),
        ),
        floatingActionButton: floatingActionButton(context), //Padding
      ), //Scaffold
      debugShowCheckedModeBanner: false,
    ); //MaterialApp
  }
}
