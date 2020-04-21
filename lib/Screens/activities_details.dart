import 'package:flutter/material.dart';
import 'package:timeline_list/timeline.dart';
import 'package:timeline_list/timeline_model.dart';

class ActivitiesDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff303030),
        elevation: 0,
        title: Text('Activities details'),
      ),
      backgroundColor: const Color(0xff303030),
      body: Timeline.builder(
        itemCount: 10,
        reverse: true,
        itemBuilder: (_, int index) => TimelineModel(
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 300,
              height: 300,
              child: Text('Some photos for activity + comment'),
              color: Colors.red,
            ),
          ),
          position: TimelineItemPosition.random,
          iconBackground: Colors.blue,
          icon: Icon(Icons.blur_circular),
        ),
      ),
    );
  }
}
