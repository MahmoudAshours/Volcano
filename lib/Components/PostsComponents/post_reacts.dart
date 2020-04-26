import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:volcano/Provider/PostsBloc/posts_bloc.dart';

class PostReacts extends StatelessWidget {
  final int index;
  final AsyncSnapshot snapshot;
  PostReacts({this.index, this.snapshot});
  @override
  Widget build(BuildContext context) {
    //TODO : Refactoring
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Consumer<PostsBloc>(
          builder: (_, _bloc, __) => Column(
            children: <Widget>[
              IconButton(
                  onPressed: () => _bloc
                      .addHandShake(snapshot.data.documents[index].reference),
                  icon: FaIcon(FontAwesomeIcons.handshake,
                      color: Colors.grey[400])),
              Text(
                '${snapshot.data.documents[index]['handshakes']}',
                style: TextStyle(
                    color: Colors.purple[100], fontWeight: FontWeight.w800),
              )
            ],
          ),
        ),
        IconButton(
            onPressed: () => print('yosh'),
            icon: FaIcon(FontAwesomeIcons.exclamationCircle,
                color: Colors.grey[400])),
      ],
    );
  }
}
