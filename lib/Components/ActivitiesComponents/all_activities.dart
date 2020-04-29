import 'package:flutter/material.dart';
import 'package:nav_router/nav_router.dart';
import 'package:provider/provider.dart';
import 'package:volcano/Components/ActivitiesComponents/activities_timeline.dart';
import 'package:volcano/Provider/ActivitiesBloc/activity_bloc.dart';

class AllActivities extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _bloc = Provider.of<ActivityBloc>(context);
    return StreamBuilder(
      stream: _bloc.getAllActivities(),
      builder: (BuildContext context, AsyncSnapshot snapshot) => !snapshot
              .hasData
          ? SliverToBoxAdapter(
              child:
                  SizedBox(child: Center(child: CircularProgressIndicator())),
            )
          : snapshot.data.documents.length == 0
              ? SliverToBoxAdapter(
                  child: Center(
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Text('There is no activities yet'),
                      ),
                    ),
                  ),
                )
              : SliverAnimatedList(
                  initialItemCount: snapshot.data.documents.length,
                  itemBuilder:
                      (BuildContext context, int index, Animation animation) =>
                          GestureDetector(
                    onTap: () => routePush(
                      ActivitiesTimeLine(snapshot: snapshot, index: index),
                      RouterType.fade,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 20.0, bottom: 20.0, left: 10.0),
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
                              child: Hero(
                                tag: '$index',
                                child: Image.network(
                                  '${snapshot.data.documents[index]['image']}',
                                  fit: BoxFit.cover,
                                  loadingBuilder: (BuildContext context,
                                      Widget child,
                                      ImageChunkEvent loadingProgress) {
                                    if (loadingProgress == null) return child;
                                    return Center(
                                      child: LinearProgressIndicator(
                                        value: loadingProgress
                                                    .expectedTotalBytes !=
                                                null
                                            ? loadingProgress
                                                    .cumulativeBytesLoaded /
                                                loadingProgress
                                                    .expectedTotalBytes
                                            : null,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
    );
  }
}
