import 'package:flutter/material.dart';
import 'package:volcano/Components/ActivitiesComponents/activity_bar.dart';
import 'package:volcano/Components/ActivitiesComponents/all_activities.dart';

class Activities extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      cacheExtent: 8,
      slivers: <Widget>[
        SliverAppBar(
          elevation: 3,
          forceElevated: true,
          centerTitle: true,
          title: Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Text(
              'Activities',
              style: TextStyle(
                color: Colors.purple[200],
              ),
            ),
          ),
          automaticallyImplyLeading: false, // Don't show the leading button
        ),
        ActivityBar(),
        AllActivities()
      ],
    );
  }
}
