import 'package:flutter/material.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: AspectRatio(
        aspectRatio: 200 / 100,
        child: Image(
          image: AssetImage('images/uhlmann_logo.png'),
        ),
      ),
    );
  }
}
