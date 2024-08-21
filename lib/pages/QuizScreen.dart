import 'package:flutter/material.dart';

import '../models/Profession.dart';
import '../models/Question.dart';

class QuizScreen extends StatefulWidget {
  final Profession profession;

  QuizScreen({required this.profession});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late List<Question> questions;
  int currentQuestionIndex = 0;
  int score = 0;
  String? selectedAnswer;
  bool showResult = false;

  @override
  void initState() {
    super.initState();
    questions = (widget.profession.questions..shuffle()).take(10).toList();
    questions.forEach((q) => q.answers.shuffle());
  }

  void selectAnswer(String answer) {
    setState(() {
      selectedAnswer = answer;
    });
  }

  void submitAnswer() {
    setState(() {
      showResult = true;
    });

    if (selectedAnswer == questions[currentQuestionIndex].correctAnswer) {
      score++;
    }

    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        showResult = false;
        selectedAnswer = null;
        if (currentQuestionIndex < questions.length - 1) {
          currentQuestionIndex++;
        } else {
          // Quiz finished
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Quiz abgeschlossen!'),
              content: Text(
                  'Richtig beantwortete Fragen: $score/${questions.length}'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  child: const Text('OK'),
                ),
              ],
            ),
          );
        }
      });
    });
  }

  Color getButtonColor(String answer) {
    if (!showResult) {
      return selectedAnswer == answer ? Colors.blueAccent : Colors.white;
    } else {
      return answer == questions[currentQuestionIndex].correctAnswer
          ? Colors.greenAccent
          : Colors.redAccent;
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz zu Beruf ${widget.profession.name}'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Updated Progress Bar
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('${currentQuestionIndex + 1}/${questions.length}'),
                const SizedBox(width: 10),
                Expanded(
                  child: LinearProgressIndicator(
                    value: (currentQuestionIndex + 1) / questions.length,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Center(
                    child: Card(
                      elevation: 4.0,
                      child: Container(
                        width: screenWidth * 0.8,
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          questions[currentQuestionIndex].questionText,
                          style: TextStyle(fontSize: screenHeight * 0.03),
                          // Adjust font size based on screen height
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  AbsorbPointer(
                    absorbing: showResult,
                    child: Column(
                      children: [
                        for (int i = 0;
                            i < questions[currentQuestionIndex].answers.length;
                            i += 2)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              for (int j = 0; j < 2; j++)
                                if (i + j <
                                    questions[currentQuestionIndex]
                                        .answers
                                        .length)
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SizedBox(
                                      width: screenWidth * 0.45,
                                      // Increase default width
                                      height: screenHeight * 0.15,
                                      // Increase default height
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: getButtonColor(
                                              questions[currentQuestionIndex]
                                                  .answers[i + j]),
                                        ),
                                        onPressed: () => selectAnswer(
                                            questions[currentQuestionIndex]
                                                .answers[i + j]),
                                        child: Text(
                                          questions[currentQuestionIndex]
                                              .answers[i + j],
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: screenHeight *
                                                  0.025), // Slightly smaller font size
                                        ),
                                      ),
                                    ),
                                  ),
                            ],
                          ),
                      ],
                    ),
                  ),
                  Container(
                    width: screenWidth * 0.6,
                    // Increase width for the submit button
                    height: screenHeight * 0.08,
                    // Standard height for the submit button
                    child: ElevatedButton(
                      onPressed: selectedAnswer != null && !showResult
                          ? submitAnswer
                          : null,
                      child: const Text('Frage beantworten.'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
