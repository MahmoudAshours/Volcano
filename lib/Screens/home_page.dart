import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:spotlightnavbar/spotlightnavbar.dart';
import 'package:volcano/Provider/AuthBloc/signin_bloc.dart';
import 'package:volcano/Screens/activities.dart';
import 'package:volcano/Screens/articles.dart';
import 'package:volcano/Screens/dep_home.dart';

class HomePage extends StatefulWidget {
  final String uid;
  final SignInBloc bloc;
  HomePage({this.uid, this.bloc});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentItem = 0;
  final List pagesList =
      List.unmodifiable([DepHome(), Activities(), Articles()]);
  @override
  void initState() {
    if (widget.uid != null) widget.bloc..userUID = widget.uid;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => true,
      child: Scaffold(
        bottomNavigationBar: SpotLightNavBar(
          animationCurve: Curves.easeInOut,
          spotLightColor: const Color(0xffBB86FC),
          items: [
            FaIcon(FontAwesomeIcons.home),
            FaIcon(FontAwesomeIcons.skyatlas),
            FaIcon(FontAwesomeIcons.bookOpen),
          ],
          onItemPressed: (int i) => setState(() => currentItem = i),
          selectedItemColor: Colors.orangeAccent,
          bottomNavBarColor: Color(0xff303030),
        ),
        body: pagesList[currentItem],
      ),
    );
  }
}
