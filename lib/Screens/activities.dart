import 'package:flutter/material.dart';
import 'package:nav_router/nav_router.dart';
import 'package:volcano/Screens/activities_details.dart';

class Activities extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          elevation: 3,
          forceElevated: true,
          title: Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Text(
              'Activities',
              style: TextStyle(
                color: Colors.purple[200],
              ),
            ),
          ),
          leading: SizedBox.shrink(),
          backgroundColor: const Color(0xff303030),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    width: 300,
                    height: 50,
                    child: Center(child: Text("Share your activity!")),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SliverAnimatedList(
          initialItemCount: 20,
          itemBuilder: (BuildContext context, int index, Animation animation) =>
              GestureDetector(
            onTap: () => routePush(ActivitiesDetails(), RouterType.fade),
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 20.0, bottom: 20.0, left: 10.0),
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: CircleAvatar(
                      backgroundColor: Colors.black,
                      child: Text('$index'),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: MediaQuery.of(context).size.width / 1.5,
                      height: 165.25,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Hello'),
                          SizedBox(height: 50),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Icon(Icons.trip_origin),
                              Icon(Icons.delete),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
