import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:volcano/Components/PostsComponents/post_modal.dart';

class PostBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _screenWidth = MediaQuery.of(context).size.width;
    final _screenHeight = MediaQuery.of(context).size.height;
    return SliverAppBar(
      pinned: true,
      title: GestureDetector(
        onTap: () =>
            showModalBottomSheet(context: context, builder: (_) => PostModal()),
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
