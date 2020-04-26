import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:volcano/Provider/ActivitiesBloc/activity_bloc.dart';

class AddActivity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ActivityBloc>(
      builder: (_, _bloc, __) => FloatingActionButton(
        onPressed: () => _bloc.writeDataFireStore(context),
        child: FaIcon(
          FontAwesomeIcons.check,
          color: Colors.amber[100],
        ),
      ),
    );
  }
}
