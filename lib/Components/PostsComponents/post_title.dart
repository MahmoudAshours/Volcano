import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:volcano/Provider/PostsBloc/posts_bloc.dart';

class PostTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<PostsBloc>(
      builder: (_, _bloc, __) => SafeArea(
        child: Container(
          child: TextField(
            onChanged: (String title) => _bloc.title = title,
            decoration: InputDecoration(
              hintText: 'Title',
              hintStyle: TextStyle(color: Colors.purple[100], fontSize: 30),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
