import 'package:flutter/material.dart';
import 'package:quizapp/wigets/widget_UhlmannHeader.dart';

import '../bi_logic/QuizManager.dart';

class AusbildungSelector extends StatelessWidget {
  final List<String> Ausbildungen = QuizManager().getAusbildungen();

  AusbildungSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // Aligns the widgets along the main axis (vertical)
        crossAxisAlignment: CrossAxisAlignment.center,
        // Aligns the widgets along the cross axis (horizontal)
        children: <Widget>[
          const UhlmannHeader(showBackButton: true),
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(256.0, 0, 256, 0),
                child: Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: List.generate(
                    Ausbildungen.length,
                        (index) {
                      return SizedBox(
                        height: 300,
                        width: 300,
                        child: Card(
                          child: InkWell(
                            borderRadius: BorderRadius.circular(10),
                            onTap: () {
                              startQuiz(Ausbildungen[index]);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: FittedBox(
                                fit: BoxFit.contain,
                                child: Text(
                                  Ausbildungen[index],
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  startQuiz(String Job) {
    print(Job);
  }
}
