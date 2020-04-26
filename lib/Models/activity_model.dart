import 'package:flutter/material.dart';

@immutable
class ActivityModel {
  final String image;
  final String shortDescription;
  final int handshakes;
  final DateTime time;
  final String userUID;
  const ActivityModel({
    @required this.image,
    @required this.userUID,
    @required this.shortDescription,
    this.handshakes = 0,
    @required this.time,
  })  : assert(image != null),
        assert(time != null),
        assert(userUID != null),
        assert(shortDescription != null);

  Map<String, dynamic> toJSON() => {
        'description': shortDescription,
        'image': image,
        'userUID': userUID,
        'handshakes': handshakes,
        'time': time
      };
}
