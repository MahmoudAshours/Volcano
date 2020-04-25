import 'package:flutter/material.dart';
import 'package:nav_router/nav_router.dart';
import 'package:volcano/Components/PostsComponents/user_posts.dart';

class PostAvatar extends StatelessWidget {
  final int index;
  final String uid;
  PostAvatar({@required this.index, @required this.uid});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => routePush(UserPosts(uid: uid)),
      child: Align(
        alignment: Alignment.centerLeft,
        child: CircleAvatar(
          backgroundColor: Colors.black,
          child: Text('$index'),
        ),
      ),
    );
  }
}
