import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:volcano/Components/ActivitiesComponents/handshakes_add.dart';

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
                  child: Column(
                    children: <Widget>[
                      FaIcon(FontAwesomeIcons.clock, color: Colors.amber[100]),
                      Text(
                        _getTime(),
                        style: GoogleFonts.openSans(color: Colors.purple[100]),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 50),
                Container(
                  child: Center(
                    child: Text(
                      '${snapshot.data.documents[index]['description']}',
                      style: GoogleFonts.openSans(fontSize: 21),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(height: 50),
                SafeArea(
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: HandShakesAdd(snapshot: snapshot, index: index),
                  ),
                )
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
      var time = _timeAgo.inHours;
      if (time == 1) {
        return '${_timeAgo.inHours} hour ago';
      } else {
        return '${_timeAgo.inHours} hours ago';
      }
    }
  }
}
