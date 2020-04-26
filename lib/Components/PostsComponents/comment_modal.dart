import 'package:flutter/material.dart';
import 'package:volcano/Components/PostsComponents/addcomment_button.dart';
import 'package:volcano/Components/PostsComponents/comment_field.dart';

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
        children: [
          SafeArea(
            minimum: EdgeInsets.only(top:10),
                      child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: 50,
                height: 10,
                decoration: BoxDecoration(
                  color: Colors.white30,
                  borderRadius:BorderRadius.circular(30)
                ),
              ),
            ),
          ),
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
          CommentField(),
          SizedBox(height: 20),
          AddComment(postID: widget.postID)
        ],
      ),
    );
  }
}
