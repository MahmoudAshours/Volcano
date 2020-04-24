import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart';
import 'package:nav_router/nav_router.dart';

class PostDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff121212),
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Text('Detailed info'),
        ),
        backgroundColor: const Color(0xff121212),
        leading: GestureDetector(
          onTap: () => pop(),
          child: Icon(Icons.arrow_back_ios, color: Colors.purple[300]),
        ),
      ),
      body: Center(
        child: Container(
          width: 50,
          height: 200,
          child: Cube(
            onSceneCreated: (Scene scene) {
              var _cube = Object(
                scale: Vector3(2.0, 2.0, 2.0),
                backfaceCulling: false,
                fileName: 'assets/brain/brain.obj',
              );
              scene.world.add(_cube);
            },
          ),
        ),
      ),
    );
  }
}
