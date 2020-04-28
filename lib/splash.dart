import 'dart:async';

import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:nav_router/nav_router.dart'; 
class Splash extends StatefulWidget {
  final Widget child;
  Splash({this.child});
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Timer(
      Duration(seconds: 2),
      () => routePush(widget.child, RouterType.fade),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: FlareActor('assets/rive/splash.flr' , animation: 'Untitled',),
        ),
      ),
    );
  }
}
