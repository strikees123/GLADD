//@dart=2.9
import 'package:flutter/material.dart';
import 'package:gladd/quizans.dart';
import 'package:gladd/quizques.dart';

class Quiz extends StatefulWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;

  Quiz({
    @required this.questions,
    @required this.answerQuestion,
    @required this.questionIndex,
  });

  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> imgList = [
    "assets/quiz/handa.jpg",
    "assets/quiz/handc.jpg",
    "assets/quiz/handg.PNG",
    "assets/quiz/handd.PNG",
    "assets/quiz/handh.PNG",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          widget.questions[widget.questionIndex]['questionText'],
        ),
        Image.asset(
          imgList[widget.questionIndex],
          height: 250.0,
          width: 250.0,
          fit: BoxFit.fill,
        ), //Question
        ...(widget.questions[widget.questionIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(() => widget.answerQuestion(answer['score']), answer['text']);
        }).toList()
      ],
    ); //Column
  }
}
