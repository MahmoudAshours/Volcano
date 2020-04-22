import 'package:dot_pagination_swiper/dot_pagination_swiper.dart';
import 'package:flutter/material.dart';
import 'package:nav_router/nav_router.dart';
import 'package:volcano/Screens/home_page.dart';
import 'package:volcano/Themes/themes.dart';

class IntroPage extends StatefulWidget {
  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  final _screenWidth = WidgetsBinding.instance.window.physicalSize.width;
  final _screenHeight = WidgetsBinding.instance.window.physicalSize.height;
  bool done = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navGK,
      theme: themes,
      home: Scaffold(
        floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
        floatingActionButton: FlatButton(
            child: DefaultTextStyle(
              child: done ? Text('Done') : Text('Skip'),
              style: TextStyle(
                color: done ? Colors.purple[100] : Colors.white,
                fontSize: 17,
              ),
            ),
            onPressed: () => routePush(HomePage(), RouterType.fade)),
        backgroundColor: themes.primaryColor,
        body: DotPaginationSwiper(
          onPageChanged: (int i) {
            if (i == 1) {
              setState(() {
                done = true;
              });
            } else {
              setState(() {
                done = false;
              });
            }
          },
          children: <Widget>[firstIntro(), secondIntro()],
        ),
      ),
    );
  }

  Widget firstIntro() {
    return Container(
      width: _screenWidth,
      height: _screenHeight,
      child: Stack(
        children: [
          SizedBox(
            child: CustomPaint(
              painter: CirclePainter(),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.chat,
                  color: Colors.white,
                  size: 30,
                ),
                SizedBox(width: 10),
                Text(
                  'Volcano',
                  style: TextStyle(color: Colors.white, fontSize: 30),
                )
              ],
            ),
          ),
          Positioned(
            left: _screenWidth / 45,
            bottom: _screenHeight / 10,
            child: Text(
              'A platform for depressed!',
              style: TextStyle(color: Colors.white.withAlpha(65), fontSize: 30),
            ),
          ),
        ],
      ),
    );
  }

  Widget secondIntro() {
    return Container(
      width: _screenWidth,
      height: _screenHeight,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            child: SizedBox(
              child: CustomPaint(
                painter: CirclePainter(),
              ),
            ),
          ),
          Positioned(
            top: 170,
            left: 60,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/female.png'),
                ),
              ),
            ),
          ),
          Positioned(
            top: 30,
            left: 10,
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/Vector.png'),
                ),
              ),
            ),
          ),
          Positioned(
            top: _screenHeight / 5,
            left: _screenWidth / 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.chat,
                  color: Colors.white,
                  size: 30,
                ),
                SizedBox(width: 10),
                Text(
                  'Volcano',
                  style: TextStyle(color: Colors.white, fontSize: 30),
                )
              ],
            ),
          ),
          Positioned(
            left: _screenWidth / 20,
            bottom: _screenHeight / 15,
            child: Container(
              width: 300,
              child: Text(
                'Suffer from depression? No problem, here you can share, and interact with people who can understand you.',
                style: TextStyle(
                  color: Colors.white.withAlpha(65),
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CirclePainter extends CustomPainter {
  final _screenWidth = WidgetsBinding.instance.window.physicalSize.width;
  Paint _paint = Paint()..color = Colors.white;
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(Offset(_screenWidth / 6, 0), 400, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
