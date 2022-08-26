import "package:flutter/material.dart";

import "./answer.dart";
import "./question.dart";

class Quiz extends StatelessWidget {
  final int questionIndex;
  final Function answerQuestion;
  final List<Map<String, Object>> questions;

  Quiz({
    required this.answerQuestion,
    required this.questions,
    required this.questionIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Question(
        questions[questionIndex]["questionText"] as String,
      ),
      ...(questions[questionIndex]["answers"] as List<Map<String, Object>>)
          .map((answer) => Answer(
                answer["text"] as String,
                () => answerQuestion(answer["score"]),
              ))
          .toList(),
    ]);
  }
}
