import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_prueba/src/pages/widgets/quiz.dart';
import 'package:flutter_prueba/src/pages/widgets/result.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  var questionIndex = 0;
  final questions = const [
    {
      "questionText": "What your favorite color?",
      "answers": [
        {"title": "Black", "score": 10},
        {"title": "Red", "score": 20},
        {"title": "Green", "score": 5},
        {"title": "White", "score": 7}
      ]
    },
    {
      "questionText": "What your favorite animal?",
      "answers": [
        {"title": "Rabbit", "score": 10},
        {"title": "Leon", "score": 20},
        {"title": "Elephant", "score": 5},
        {"title": "Cat", "score": 7}
      ]
    },
    {
      "questionText": "What your favorite instructor?",
      "answers": [
        {"title": "Max", "score": 10},
        {"title": "Anna", "score": 20},
        {"title": "Sofia", "score": 5},
        {"title": "Mark", "score": 7}
      ]
    },
  ];

  var totalScore = 0;

  void _resetQuiz() {
    setState(() {
      questionIndex = 0;
      totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    totalScore += score;

    if (questionIndex < questions.length) {}
    setState(() {
      questionIndex = questionIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Daniel"),
        backgroundColor: Colors.blueGrey[900],
      ),
      body: Container(
        child: questionIndex < questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questions: questions,
                questionIndex: questionIndex,
              )
            : Result(totalScore, _resetQuiz),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.camera),
          onPressed: () {
            Navigator.pushNamed(context, '/camara');
          }),
    );
  }
}
