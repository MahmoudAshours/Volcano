import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:volcano/Provider/ActivitiesBloc/activity_bloc.dart';

class HandShakesAdd extends StatelessWidget {
  final AsyncSnapshot snapshot;
  final int index;
  HandShakesAdd({@required this.snapshot, @required this.index});
  @override
  Widget build(BuildContext context) {
    return Consumer<ActivityBloc>(
      builder: (_, _bloc, __) => Container(
        child: Column(
          children: <Widget>[
            InkWell(
              onTap: () =>
                  _bloc.addHandShake(snapshot.data.documents[index].reference),
              child: FaIcon(
                FontAwesomeIcons.handshake,
                color: Colors.amber[100],
              ),
            ),
            Text('${snapshot.data.documents[index]['handshakes']}')
          ],
        ),
      ),
    );
  }
}
