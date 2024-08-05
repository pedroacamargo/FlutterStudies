import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int finalScore;
  final Function() resetQuiz;
  const Result(this.finalScore, this.resetQuiz, {super.key});

  String get resultPhrase {
    if (finalScore < 8) {
      return "You are awesome!";
    } else if (finalScore < 12) {
      return "You are good!";
    } else if (finalScore < 16) {
      return "You are... strange?!";
    } else {
      return "You are so bad!";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Text(
            resultPhrase,
            style: const TextStyle(
              fontSize: 28,
            ),
          ),
        ),
        TextButton(
          onPressed: resetQuiz,
          child: const Text(
            "Restart",
            style: TextStyle(
              color: Colors.blue,
            ),
          ),
        ),
      ],
    );
  }
}
