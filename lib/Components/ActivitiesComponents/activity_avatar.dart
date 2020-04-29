import 'package:flutter/material.dart';

class ActivityAvatar extends StatelessWidget {
  final int index;
  final String uid;
  ActivityAvatar({@required this.index, @required this.uid});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: CircleAvatar(
        backgroundColor: Colors.black,
        child: Text('${uid.substring(0, 2).toUpperCase()}'),
      ),
    );
  }
}
