import 'package:flutter/material.dart';

///Theme used in application.
ThemeData themes = ThemeData(
  primaryColor: const Color(0xff303030),
  accentColor: const Color(0xff363A44),
  brightness: Brightness.dark,
  iconTheme: IconThemeData(color: Colors.purple[300]),
  scaffoldBackgroundColor: const Color(0xff303030),
  textTheme: TextTheme(
    button: TextStyle(color: Colors.red),
  ),
);
