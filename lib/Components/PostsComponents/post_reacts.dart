import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PostReacts extends StatelessWidget {
  final int index;
  PostReacts({this.index});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        IconButton(
            onPressed: () => print('hi'),
            icon: FaIcon(FontAwesomeIcons.commentAlt, color: Colors.grey[400])),
        IconButton(
            onPressed: () => print('hello'),
            icon: FaIcon(FontAwesomeIcons.handshake, color: Colors.grey[400])),
        IconButton(
            onPressed: () => print('yosh'),
            icon: FaIcon(FontAwesomeIcons.exclamationCircle,
                color: Colors.grey[400])),
      ],
    );
  }
}
