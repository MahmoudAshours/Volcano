import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:volcano/Components/PostsComponents/handshake.dart';

class PostReacts extends StatelessWidget {
  final int index;
  final AsyncSnapshot snapshot;
  PostReacts({this.index, this.snapshot});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        HandShake(index: index, snapshot: snapshot),
        IconButton(
            onPressed: () => print('yosh'),
            icon: FaIcon(FontAwesomeIcons.exclamationCircle,
                color: Colors.grey[400])),
      ],
    );
  }
}
