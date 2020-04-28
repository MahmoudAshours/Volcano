import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:timeline_list/timeline.dart';
import 'package:timeline_list/timeline_model.dart';
import 'package:volcano/Components/ActivitiesComponents/activities_details.dart';

class ActivitiesTimeLine extends StatelessWidget {
  final AsyncSnapshot snapshot;
  final int index;
  ActivitiesTimeLine({@required this.index, @required this.snapshot});
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
        itemCount: snapshot.data.documents.length,
        reverse: true,
        itemBuilder: (_, int i) {
          return TimelineModel(
            GestureDetector(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) =>
                      ActivitiesDetails(snapshot: snapshot, index: i))),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Hero(
                  transitionOnUserGestures: true,
                  tag: '$i',
                  child: Badge(
                    badgeColor: Color(0xff03dac6).withAlpha(40),
                    animationType: BadgeAnimationType.fade,
                    position: BadgePosition.bottomRight(),
                    borderRadius: 10,
                    elevation: 3,
                    shape: BadgeShape.circle,
                    animationDuration: Duration(seconds: 1),
                    badgeContent: Column(
                      children: <Widget>[
                        FaIcon(
                          FontAwesomeIcons.handshake,
                          color: Colors.amber[100],
                        ),
                        Text('${snapshot.data.documents[i]['handshakes']}')
                      ],
                    ),
                    child: Container(
                      width: 300,
                      height: 300,
                      decoration: BoxDecoration(
                        color: Colors.amber[100],
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            snapshot.data.documents[i]['image'],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            position: index % 2 == 0
                ? TimelineItemPosition.left
                : TimelineItemPosition.right,
            iconBackground: Colors.transparent,
            icon: Icon(Icons.timeline, color: Colors.purple[100]),
          );
        },
      ),
    );
  }
}
