import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart';
import 'package:nav_router/nav_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:volcano/Screens/home_page.dart';

class Page3D extends StatefulWidget {
  Page3D({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Page3D> with TickerProviderStateMixin {
  Scene _scene;
  Object _cube;
  AnimationController _controller, _inController;
  double offset;
  double test;
  double phi;

  void _onSceneCreated(Scene scene) {
    _scene = scene;
    scene.camera.position.z = 50;
    _cube = Object(
      scale: Vector3(2.0, 2.0, 2.0),
      backfaceCulling: false,
      fileName: 'assets/Cube/cube.obj',
    );

    final int samples = 100;
    final double radius = 8; // Best practice
    offset = 2 / samples; // 0.02
    final double increment = 5 * (1 - sqrt(5)); // Good Best practice
    for (var i = 0; i < samples; i++) {
      final y = (i * offset - 1) + offset / 2;
      final r = sqrt(1 - pow(y, 2));

      phi = ((i + 1) % samples) * increment;

      final x = cos(phi) * r;
      final z = sin(phi) * r;

      final Object cube = Object(
        position: Vector3(x, y, z)..scale(radius),
        fileName: 'assets/Cube/cube.obj',
      );
      cube.name = "Object number $i";
      _cube.add(cube);
    }
    scene.world.add(_cube);
  }

  @override
  void initState() {
    super.initState();
    checkIntro();
    _controller = AnimationController(
        duration: Duration(milliseconds: 30000), vsync: this)
      ..addListener(
        () {
          if (_cube != null) {
            _cube.rotation.y = _controller.value * 1000;
            _cube.updateTransform();
            _scene.update();
          }
        },
      )
      ..repeat();

    _inController =
        AnimationController(duration: Duration(seconds: 3), vsync: this)
          ..addListener(
            () {
              _cube.position.x = _inController.value * -30;
              _cube.updateTransform();
              _scene.update();
            },
          );
  }

  @override
  void dispose() {
    _controller.dispose();
    _inController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:
          FloatingActionButton(onPressed: () => _controller.stop()),
      backgroundColor: Color(0xff121212),
      body: Center(
        child: InkWell(
          onLongPress: () => _inController.forward().whenComplete(
            () {
              _inController..reverse();
              routePush(HomePage(), RouterType.scale);
            },
          ),
          splashColor: Colors.blue,
          child: Cube(
            onSceneCreated: _onSceneCreated,
          ),
        ),
      ),
    );
  }

  Future<Null> checkIntro() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.getBool('intro') ?? prefs.setBool('intro', false);
  }
}
