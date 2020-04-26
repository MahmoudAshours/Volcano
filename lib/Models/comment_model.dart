import 'package:flutter/material.dart';

@immutable
class CommentModel {
  final String comment;
  final String userID;
  const CommentModel({@required this.comment, @required this.userID});

  Map<String, dynamic> toJSON() {
    return {'comment': comment, 'userID': userID};
  }
}
