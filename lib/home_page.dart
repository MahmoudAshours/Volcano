import 'package:flutter/material.dart';
import 'package:spotlightnavbar/spotlightnavbar.dart';
import 'package:volcano/details.dart';
import 'package:volcano/know_more.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentItem = 0;

  final List pagesList = List.unmodifiable([DepHome(), KnowMore()]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff121212),
      bottomNavigationBar: SpotLightNavBar(
        animationCurve: Curves.easeInOut,
        spotLightColor: Color(0xffBB86FC),
        items: [Icon(Icons.transform), Icon(Icons.transform)],
        onItemPressed: (i) {
          setState(() {
            currentItem = i;
          });
        },
        selectedItemColor: Colors.orangeAccent,
        bottomNavBarColor: Color(0xff121212),
      ),
      body: pagesList[currentItem],
    );
  }
}
