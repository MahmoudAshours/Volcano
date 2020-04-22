import 'package:flutter/material.dart';
import 'package:nav_router/nav_router.dart';
import 'package:volcano/Screens/home_page.dart';
import 'package:volcano/Themes/themes.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navGK,
      theme: themes,
      title: 'Volcano',
      home: HomePage(),
    );
  }
}
