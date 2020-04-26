import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:volcano/Provider/ActivitiesBloc/activity_bloc.dart';

class ActivityImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ActivityBloc>(
      builder: (_, _bloc, __) => GestureDetector(
        onTap: () => _bloc.executeAll(),
        child: Align(
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              Container(
                child: FaIcon(
                  FontAwesomeIcons.camera,
                  color: Colors.amber[100],
                ),
              ),
              Text(
                'Upload your image',
                style: TextStyle(color: Colors.purple[100]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
