import 'package:flutter/material.dart';
import 'package:gradient_text/gradient_text.dart';

class JourneyText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 40.0, top: 40.0),
        child: GradientText(
          "Ready to start your journey?",
          gradient:
              LinearGradient(colors: [Colors.purple[100], Colors.amber[100]]),
          style: TextStyle(fontSize: 42),
          textAlign: TextAlign.start,
        ),
      ),
    );
  }
}
