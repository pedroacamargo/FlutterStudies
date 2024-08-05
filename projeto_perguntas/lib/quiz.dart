import 'package:flutter/material.dart';
import 'package:projeto_perguntas/answer.dart';
import 'package:projeto_perguntas/questao.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int selectedQuestion;
  final void Function(int) toAnswer;

  const Quiz({
    super.key,
    required this.perguntas,
    required this.selectedQuestion,
    required this.toAnswer,
  });

  bool get hasSelectedQuestion {
    return selectedQuestion < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> answers = hasSelectedQuestion
        ? perguntas[selectedQuestion].cast()["answers"]
        : [];

    return Column(
      children: <Widget>[
        Questao(perguntas[selectedQuestion]["text"].toString()),
        ...answers.map((resp) => Answer(resp["text"].toString(),
            () => toAnswer(int.parse(resp["score"].toString())))),
      ],
    );
  }
}
