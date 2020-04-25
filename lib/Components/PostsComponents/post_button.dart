import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:volcano/Provider/PostsBloc/posts_bloc.dart';

class PostButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<PostsBloc>(
      builder: (_, _bloc, __) => SafeArea(
        child: FloatingActionButton(
          onPressed: () => _bloc.addUsersPosts(),
          child: Text('Post!'),
        ),
      ),
    );
  }
}
