import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PostsModel {
  final String title;
  final String description;
  Timestamp time;
  int handshakes;
  int reports;
  PostsModel({@required this.title, @required this.description});
  Map<String, dynamic> toJSON(uid) => {
        'title': title,
        'description': description,
        'time': DateTime.now(),
        'handshakes': 0,
        'reports': 0,
        'userID': uid
      };
}
