import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart';
import 'package:nav_router/nav_router.dart';
import 'package:volcano/custom_page.dart';

class DepHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          elevation: 3,
          forceElevated: true,
          title: Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Text(
              'Here!',
              style: TextStyle(
                color: Colors.purple[200],
              ),
            ),
          ),
          leading: SizedBox.shrink(),
          backgroundColor: Color(0xff121212),
        ),
        SliverAnimatedList(
          initialItemCount: 20,
          itemBuilder: (context, index, animation) => GestureDetector(
            onTap: () => routePush(CustomPage(), RouterType.fade),
            onLongPress: ()=>print('hello'),
            child: ListTile(
              title: Text(
                'Some Text here',
                style: TextStyle(color: Colors.white.withOpacity(0.8)),
              ),
              leading: Container(
                width: 50,
                height: 100,
                child: Cube(
                  onSceneCreated: (scene) {
                    var _cube = Object(
                      scale: Vector3(2.0, 2.0, 2.0),
                      backfaceCulling: false,
                      fileName: 'assets/Cube/cube.obj',
                    );
                    scene.world.add(_cube);
                  },
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
