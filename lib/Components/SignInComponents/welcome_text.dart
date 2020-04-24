import 'package:flutter/material.dart';
import 'package:gradient_text/gradient_text.dart';

class WelcomeText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GradientText(
      "Glad to see you again!",
      gradient: LinearGradient(
          colors: [Colors.deepPurple, Colors.purple[100], Colors.amber[100]]),
      style: TextStyle(fontSize: 42),
      textAlign: TextAlign.start,
    );
  }
}
