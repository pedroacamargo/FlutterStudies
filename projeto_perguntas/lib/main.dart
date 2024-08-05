// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:projeto_perguntas/quiz.dart';
import 'package:projeto_perguntas/result.dart';

main() => runApp(_PerguntaApp());

class _PerguntaAppState extends State<_PerguntaApp> {
  var _selectedQuestion = 0;
  var _totalScore = 0;

  final List<Map<String, Object>> _perguntas = const [
    {
      "text": "What's your favorite colour?",
      "answers": [
        {"text": "Black", "score": 10},
        {"text": "Red", "score": 5},
        {"text": "Green", "score": 2},
        {"text": "White", "score": 8},
      ],
    },
    {
      "text": "What's your favorite animal?",
      "answers": [
        {"text": "Rabbit", "score": 3},
        {"text": "Snake", "score": 6},
        {"text": "Elephant", "score": 9},
        {"text": "Lion", "score": 2},
      ],
    },
    {
      "text": "What's your favorite instructor?",
      "answers": [
        {"text": "Max", "score": 1},
        {"text": "Leo", "score": 2},
        {"text": "Jack", "score": 3},
        {"text": "Peter", "score": 4},
      ],
    },
  ];

  void _answer(int score) {
    if (hasSelectedQuestion) {
      setState(() {
        _selectedQuestion++;
        _totalScore += score;
      });
    }
    print(_totalScore);
  }

  void _resetQuiz() {
    setState(() {
      _selectedQuestion = 0;
      _totalScore = 0;
    });
  }

  bool get hasSelectedQuestion {
    return _selectedQuestion < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Center(
            child: Text(
              "Perguntas",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        body: hasSelectedQuestion
            ? Quiz(
                perguntas: _perguntas,
                selectedQuestion: _selectedQuestion,
                toAnswer: _answer,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}

class _PerguntaApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
