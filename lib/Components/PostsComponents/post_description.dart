import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:volcano/Provider/PostsBloc/posts_bloc.dart';

class PostDescription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<PostsBloc>(
      builder: (_, _bloc, __) => SafeArea(
        child: Container(
          child: TextField(
            onChanged: (String description) => _bloc.description = description,
            minLines: 20,
            maxLines: 100,
            buildCounter: counter,
            decoration: InputDecoration(
              hintText: 'Your story...',
              hintStyle: TextStyle(color: Colors.amber[100], fontSize: 20),
              border: OutlineInputBorder(gapPadding: 20),
            ),
          ),
        ),
      ),
    );
  }

  Text counter(
    BuildContext context, {
    int currentLength,
    int maxLength,
    bool isFocused,
  }) {
    return Text(
      '$currentLength',
      style: TextStyle(color: isFocused ? Colors.purple[100] : Colors.grey),
      semanticsLabel: 'character count',
    );
  }
}
