import 'package:flutter/material.dart';

class ActivitiesDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'timeline_hero 0',
      child: Container(
        width: 300,
        height: 300,
        decoration: BoxDecoration(
          color: Colors.purple,
          image: DecorationImage(
            image: AssetImage('assets/images/female.png'),
          ),
        ),
      ),
    );
  }
}
