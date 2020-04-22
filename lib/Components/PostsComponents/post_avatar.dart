import 'package:flutter/material.dart';

class PostAvatar extends StatelessWidget {
  final int index;
  PostAvatar({@required this.index});
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: CircleAvatar(
        backgroundColor: Colors.black,
        child: Text('$index'),
      ),
    );
  }
}
