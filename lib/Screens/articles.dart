import 'package:flutter/material.dart';

class Articles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          elevation: 3,
          snap: true,
          floating: true,
          centerTitle: true,
          automaticallyImplyLeading: false, // Don't show the leading button
          stretch: true,
          forceElevated: true,
          title: Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Text(
              'Articles',
              style: TextStyle(
                color: Colors.purple[200],
              ),
            ),
          ),
          backgroundColor: const Color(0xff303030),
        ),
        SliverGrid.count(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          children: <Widget>[
            Container(color: Colors.red, width: 300, height: 300),
            Container(color: Colors.black, width: 300, height: 300),
            Container(color: Colors.blue, width: 300, height: 300),
            Container(color: Colors.redAccent, width: 300, height: 300),
            Container(color: Colors.indigo, width: 300, height: 300),
            Container(color: Colors.yellow, width: 300, height: 300),
            Container(color: Colors.blue, width: 300, height: 300),
            Container(color: Colors.amber, width: 300, height: 300),
          ],
        )
      ],
    );
  }
}
