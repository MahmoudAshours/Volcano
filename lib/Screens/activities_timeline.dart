import 'package:flutter/material.dart';
import 'package:timeline_list/timeline.dart';
import 'package:timeline_list/timeline_model.dart';
import 'package:volcano/Screens/activities_details.dart';

class ActivitiesTimeLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff303030),
        elevation: 0,
        title: Text('Activities TimeLine'),
      ),
      backgroundColor: const Color(0xff303030),
      body: Timeline.builder(
        itemCount: 10,
        reverse: true,
        itemBuilder: (_, int index) => TimelineModel(
          GestureDetector(
            onTap: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => ActivitiesDetails())),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Hero(
                transitionOnUserGestures: true,
                tag: 'timeline_hero $index',
                child: Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    image: DecorationImage(
                      image: AssetImage('assets/images/female.png'),
                    ),
                  ),
                ),
              ),
            ),
          ),
          position: TimelineItemPosition.random,
          iconBackground: Colors.transparent,
          icon: Icon(Icons.timeline, color: Colors.purple[100]),
        ),
      ),
    );
  }
}
