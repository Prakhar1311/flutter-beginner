import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  final List<Map<String, Object>> questions;
  final int qindex;
  final Function answerQuestion;

  Quiz({
    required this.questions,
    required this.answerQuestion,
    required this.qindex,
  });

  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  @override
  Widget build(BuildContext context) {
    double score = 0;
    return Slider(
      value: score,
      divisions: 4,
      onChanged: (double newScore) {
        setState(() {
          score = newScore;
        });
      },
    );
  }
}
