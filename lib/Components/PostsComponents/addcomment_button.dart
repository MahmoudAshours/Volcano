import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:volcano/Provider/PostsBloc/posts_bloc.dart';

class AddComment extends StatelessWidget {
  final postID;
  AddComment({@required this.postID});
  @override
  Widget build(BuildContext context) {
    return Consumer<PostsBloc>(
      builder: (_, _bloc, __) => FloatingActionButton(
        onPressed: () => _bloc.addComment(context, postID),
        child: FaIcon(
          FontAwesomeIcons.check,
          color: Colors.amber[100],
        ),
      ),
    );
  }
}
