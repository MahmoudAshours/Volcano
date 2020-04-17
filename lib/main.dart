import 'package:flutter/material.dart';
import 'package:nav_router/nav_router.dart';
import 'package:volcano/Screens/main_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navGK,
      title: 'Volcano',
      home: MyHomePage(),
    );
  }
}
