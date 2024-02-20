import 'package:flutter/material.dart';
import 'package:quizapp/pages/page_Ausbildung.dart';
import 'package:quizapp/pages/page_Studium.dart';

class CareerSelecter extends StatelessWidget {
  const CareerSelecter({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildAusbildungButton(context),
              const SizedBox(width: 100),
              buildStudiumButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Expanded buildAusbildungButton(BuildContext context) {
    return Expanded(
      child: Card(
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AusbildungSelector()));
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FittedBox(
              fit: BoxFit.contain,
              child: Text(
                'Ausbildung',
                textAlign: TextAlign.center,
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Expanded buildStudiumButton(BuildContext context) {
    return Expanded(
      child: Card(
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => StudiumSelector()));
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FittedBox(
              fit: BoxFit.contain,
              child: Text(
                'Studium',
                textAlign: TextAlign.center,
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
