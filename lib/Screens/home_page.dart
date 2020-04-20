import 'package:flutter/material.dart';
import 'package:spotlightnavbar/spotlightnavbar.dart';
import 'package:volcano/Screens/activities.dart';
import 'package:volcano/Screens/articles.dart';
import 'package:volcano/Screens/details.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentItem = 0;
  final List pagesList =
      List.unmodifiable([DepHome(), Activities(), Articles()]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff303030),
      bottomNavigationBar: SpotLightNavBar(
        animationCurve: Curves.easeInOut,
        spotLightColor: const Color(0xffBB86FC),
        items: [
          Icon(Icons.transform),
          Icon(Icons.transform),
          Icon(Icons.airline_seat_recline_extra)
        ],
        onItemPressed: (int i) => setState(() => currentItem = i),
        selectedItemColor: Colors.orangeAccent,
        bottomNavBarColor: Color(0xff303030),
      ),
      body: pagesList[currentItem],
    );
  }
}
