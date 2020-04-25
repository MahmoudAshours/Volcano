import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nav_router/nav_router.dart';
import 'package:volcano/Components/PostsComponents/post_screen.dart';

class PostBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _screenWidth = MediaQuery.of(context).size.width;
    final _screenHeight = MediaQuery.of(context).size.height;
    return SliverAppBar(
      pinned: true,
      automaticallyImplyLeading: false, // Don't show the leading button
      title: GestureDetector(
        onTap: () => routePush(PostScreen(), RouterType.fade),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              width: _screenWidth / 1.2,
              height: _screenHeight / 15,
              child: Center(
                  child: Text("What's on your mind?",
                      style: GoogleFonts.openSans(color: Colors.purple[200]))),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
