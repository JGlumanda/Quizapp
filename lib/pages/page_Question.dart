import 'package:flutter/material.dart';

import '../wigets/widget_UhlmannHeader.dart';

class QuestionPage extends StatefulWidget {
  QuestionPage({Key? key}) : super(key: key);

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  int selectedAnswer = 0;
  int currentQuestion = 0;
  int correctAnswers = 0;
  bool showCorrectAnswer = false;
  List<String> answers = ["Berlin", "Hamburg", "Munich", "Cologne"];

  void _showCorrectAnswer() {
    setState(() {
      selectedAnswer = -1;
      showCorrectAnswer = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AbsorbPointer(
        absorbing: showCorrectAnswer,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const UhlmannHeader(showBackButton: true),
            const Text("Question 1 of 10"),
            const Text("What is the capital of Germany?"),
            buildAnswerRow(context, 0),
            buildAnswerRow(context, 2),
            buildProgressionBar(context),
            buildNextButton(context),
          ],
        ),
      ),
    );
  }

  Widget buildAnswerRow(BuildContext context, int start) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          buildAnswerButton(context, start),
          buildAnswerButton(context, start + 1),
        ],
      ),
    );
  }

  buildNextButton(BuildContext context) {
    return Flexible(
      child: SizedBox(
        height: 100,
        width: 400,
        child: Card(
          child: InkWell(
            onTap: () {
              _showCorrectAnswer();
            },
            borderRadius: BorderRadius.circular(10),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: FittedBox(
                fit: BoxFit.contain,
                child: Text(
                  'Nächste Frage',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  buildAnswerButton(BuildContext context, int i) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(
              color: (selectedAnswer == i)
                  ? Theme.of(context).primaryColor
                  : (showCorrectAnswer && i == 0)
                      ? Colors.green
                      : Colors.red,
              width: 2,
            ),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: () {
              setState(() {
                selectedAnswer = i;
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  answers[i],
                  textAlign: TextAlign.center,
                  softWrap: true,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 40,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  buildProgressionBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: LinearProgressIndicator(
        borderRadius: BorderRadius.circular(10),
        minHeight: 10,
        value: currentQuestion / 10,
      ),
    );
  }
}
