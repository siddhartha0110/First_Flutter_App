import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int score;
  final Function restart;
  Result(this.score, this.restart);

  String get resultAnswer {
    var resText = 'END OF QUIZ';
    if (score == 6) {
      resText = "GREAT WORK!!";
    } else if (score == 4) {
      resText = "Good Work";
    } else if (score == 2) {
      resText = "NOOB";
    } else {
      resText = "Up your knowledge bro";
    }
    return resText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultAnswer,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            onPressed: restart,
            child: Text('Retake Quiz'),
            textColor: Colors.blueAccent,
          ),
        ],
      ),
    );
  }
}
