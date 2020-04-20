import 'package:flutter/material.dart';
import 'package:nav_router/nav_router.dart';
import 'package:volcano/Screens/page_3d.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navGK,
      title: 'Volcano',
      home: Page3D(),
    );
  }
}
