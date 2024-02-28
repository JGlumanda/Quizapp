import 'package:flutter/material.dart';

class UhlmannHeader extends StatelessWidget {
  const UhlmannHeader({super.key, required this.showBackButton});

  final bool showBackButton;

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Expanded(
            child: Image(
              image: AssetImage('assets/images/uhlmann_logo.png'),
            ),
          ),
          if (showBackButton) buildBackButton(context),
          const Expanded(
            child: Image(
              image: AssetImage('assets/images/uhlmann_logo.png'),
            ),
          )
        ],
    );
  }

  Flexible buildBackButton(BuildContext context) {
    return Flexible(
      child: SizedBox(
        height: 100,
        width: 400,
        child: Card(
          child: InkWell(
            onTap: () {
              Navigator.of(context).popUntil((route) => route.isFirst);
            },
            borderRadius: BorderRadius.circular(10),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: FittedBox(
                fit: BoxFit.contain,
                child: Text(
                  'Quiz beenden',
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
}
