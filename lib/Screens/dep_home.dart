import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nav_router/nav_router.dart';
import 'package:volcano/Components/PostsComponents/post_avatar.dart';
import 'package:volcano/Components/PostsComponents/post_bar.dart';
import 'package:volcano/Components/PostsComponents/post_reacts.dart';
import 'package:volcano/Screens/custom_page.dart';

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
            leading: SizedBox.shrink(),
          ),
          PostBar(),
          SliverAnimatedList(
            initialItemCount: 20,
            itemBuilder:
                (BuildContext context, int index, Animation animation) =>
                    GestureDetector(
              onTap: () => routePush(CustomPage(), RouterType.fade),
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 20.0, bottom: 20.0, left: 10.0),
                child: Stack(
                  children: <Widget>[
                    PostAvatar(index: index),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: MediaQuery.of(context).size.width / 1.5,
                        height: 165.25,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Text(
                                'Hello I am philip from the Flutter team and I\'m very depressed',
                                maxLines: 2,
                                overflow: TextOverflow.fade,
                                style: GoogleFonts.openSans(
                                    color: Colors.purple[200]),
                              ),
                            ),
                            SizedBox(height: 50),
                            PostReacts()
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
