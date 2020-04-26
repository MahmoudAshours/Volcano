import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:volcano/Provider/PostsBloc/posts_bloc.dart';

class CommentModal extends StatefulWidget {
  final String postID;
  CommentModal({@required this.postID});
  @override
  _CommentModalState createState() => _CommentModalState();
}

class _CommentModalState extends State<CommentModal> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Leave your comment',
              style: TextStyle(
                fontSize: 23,
                color: Colors.purple[100],
              ),
            ),
          ),
          Consumer<PostsBloc>(
            builder: (_, _bloc, __) => TextField(
              minLines: 10,
              maxLines: 100,
              onChanged: (String comment) => _bloc.comment = comment,
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
          ),
          SizedBox(height: 20),
          Consumer<PostsBloc>(
            builder: (_, _bloc, __) => FloatingActionButton(
              onPressed: () => _bloc.addComment(context, widget.postID),
              child: FaIcon(
                FontAwesomeIcons.check,
                color: Colors.amber[100],
              ),
            ),
          )
        ],
      ),
    );
  }
}
