import 'package:cloud_firestore/cloud_firestore.dart';

class PostsModel {
  String title;
  String description;
  Timestamp time;
  int handshakes;
  int reports;

  Map<String, dynamic> toJSON()  {
    return {
      'title': title,
      'description': description,
      'time': time,
      'handshakes': handshakes,
      'reports': reports
    };
  }
}
