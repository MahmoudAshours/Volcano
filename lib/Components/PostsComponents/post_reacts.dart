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
        FaIcon(FontAwesomeIcons.commentAlt, color: Colors.grey[400]),
        FaIcon(FontAwesomeIcons.handshake, color: Colors.grey[400]),
        FaIcon(FontAwesomeIcons.exclamationCircle, color: Colors.grey[400]),
      ],
    );
  }
}
