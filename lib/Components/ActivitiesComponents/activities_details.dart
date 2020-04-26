import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ActivitiesDetails extends StatelessWidget {
  final AsyncSnapshot snapshot;
  final int index;
  ActivitiesDetails({this.snapshot, this.index});
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: '$index',
      child: Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          '${snapshot.data.documents[index]['image']}'),
                    ),
                  ),
                ),
                SizedBox(height: 40),
                Container(
                  child: Text(_getTime()),
                ),
                Container(
                  child:
                      Text('${snapshot.data.documents[index]['description']}'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _getTime() {
    final _timeAgo = DateTime.now()
        .difference(snapshot.data.documents[index]['time'].toDate());
    if (_timeAgo.inSeconds < 60) {
      return "${_timeAgo.inSeconds} seconds ago";
    } else if (_timeAgo.inSeconds > 60 && _timeAgo.inMinutes < 60) {
      return "${_timeAgo.inMinutes} minutes ago";
    } else {
      return "${_timeAgo.inHours == 1 ? '1 hour ago' : '_timeAgo.inHours  hours ago'}";
    }
  }
}
