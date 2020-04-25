import 'package:flutter/material.dart';
import 'package:volcano/Components/PostsComponents/post_button.dart';
import 'package:volcano/Components/PostsComponents/post_description.dart';
import 'package:volcano/Components/PostsComponents/post_title.dart';

class PostScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            PostTitle(),
            PostDescription(),
            PostButton(),
          ],
        ),
      ),
    );
  }
}
