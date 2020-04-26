import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:volcano/Components/PostsComponents/all_posts.dart';
import 'package:volcano/Components/PostsComponents/post_bar.dart';
import 'package:volcano/Provider/AuthBloc/signin_bloc.dart';

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
            centerTitle: true,
            actions: <Widget>[
              Consumer<SignInBloc>(
                builder: (_, _bloc, __) => IconButton(
                  icon: FaIcon(
                    FontAwesomeIcons.signOutAlt,
                    color: Colors.red,
                  ),
                  onPressed: () => _bloc.signOut(context),
                ),
              )
            ],
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
