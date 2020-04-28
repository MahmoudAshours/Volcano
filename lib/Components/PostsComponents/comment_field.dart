import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:volcano/Provider/PostsBloc/posts_bloc.dart';

class CommentField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<PostsBloc>(
      builder: (_, _bloc, __) => TextField(
        minLines: 10,
        maxLines: 100,
        onChanged: (String comment) => _bloc.comment = comment,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
