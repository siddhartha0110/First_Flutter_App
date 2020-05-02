import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  static const _questions = [
    {
      'questionText': 'Aqua Regia Contains',
      'answers': [
        {'text': 'Hydrochloric Acid + Ammonia', 'score': 0},
        {'text': 'Hydrochloric Acid + Sulphuric Acid', 'score': 0},
        {'text': 'Hydrochloric Acid + Nitric Acid', 'score': 2},
        {'text': 'Ammonia', 'score': 0},
      ],
    },
    {
      'questionText': 'Newton\'s Third Law of motion states',
      'answers': [
        {'text': 'Inertia', 'score': 0},
        {'text': 'F=Mass X Acceleration', 'score': 0},
        {'text': 'Equal Reaction', 'score': 0},
        {'text': 'Equal And Opposite Reaction', 'score': 2},
      ],
    },
    {
      'questionText': 'Chris not present in Avengers',
      'answers': [
        {'text': 'Evans', 'score': 0},
        {'text': 'Gayle', 'score': 2},
        {'text': 'Hemsworth', 'score': 0},
        {'text': 'Pratt', 'score': 0},
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
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                questions: _questions,
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
