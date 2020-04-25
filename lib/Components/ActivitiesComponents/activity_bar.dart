import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ActivityBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      centerTitle: true,
      automaticallyImplyLeading: false, // Don't show the leading button
      pinned: true,
      title: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 300,
            height: 50,
            child: Center(
                child: Text("Share your activity!",
                    style: GoogleFonts.openSans(color: Colors.purple[200]))),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
