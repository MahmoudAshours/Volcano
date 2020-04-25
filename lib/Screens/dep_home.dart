import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:volcano/Components/PostsComponents/all_posts.dart';
import 'package:volcano/Components/PostsComponents/post_bar.dart';

class DepHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => true,
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            elevation: 3,
            forceElevated: true,
            title: Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Text(
                'Home',
                style: GoogleFonts.openSans(color: Colors.purple[200]),
              ),
            ),
            automaticallyImplyLeading: false, // Don't show the leading button
          ),
          PostBar(),
          AllPosts()
        ],
      ),
    );
  }
}
