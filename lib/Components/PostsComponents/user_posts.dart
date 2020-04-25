import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timeline_list/timeline.dart';
import 'package:timeline_list/timeline_model.dart';
import 'package:volcano/Provider/PostsBloc/posts_bloc.dart';

class UserPosts extends StatelessWidget {
  final String uid;
  UserPosts({this.uid});
  @override
  Widget build(BuildContext context) {
    final _bloc = Provider.of<PostsBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Previewing users' posts"),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: _bloc.userPosts,
        builder: (_, AsyncSnapshot snapshot) => !snapshot.hasData
            ? CircularProgressIndicator()
            : Center(
                child: Container(
                  child: Timeline.builder(
                    itemCount: snapshot.data.documents.length,
                    reverse: true,
                    itemBuilder: (_, int index) => TimelineModel(
                      GestureDetector(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 300,
                            child: Text(
                                '${snapshot.data.documents[index]['title']}'),
                          ),
                        ),
                      ),
                      position: TimelineItemPosition.random,
                      iconBackground: Colors.transparent,
                      icon: Icon(Icons.panorama_fish_eye,
                          color: Colors.purple[100]),
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
