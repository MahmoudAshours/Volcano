import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nav_router/nav_router.dart';
import 'package:provider/provider.dart';
import 'package:volcano/Components/PostsComponents/post_avatar.dart';
import 'package:volcano/Components/PostsComponents/post_reacts.dart';
import 'package:volcano/Provider/PostsBloc/posts_bloc.dart';
import 'package:volcano/Screens/post_details.dart';

class AllPosts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _bloc = Provider.of<PostsBloc>(context);
    return StreamBuilder(
      stream: _bloc.allPosts,
      builder: (BuildContext context, AsyncSnapshot snapshot) => !snapshot
              .hasData
          ? SliverToBoxAdapter(
              child: SizedBox(child: CircularProgressIndicator()),
            )
          : SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => GestureDetector(
                  onTap: () => routePush(
                      PostDetails(snapshot: snapshot, index: index),
                      RouterType.fade),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 20.0,
                      bottom: 20.0,
                      left: 10.0,
                    ),
                    child: Stack(
                      children: <Widget>[
                        PostAvatar(
                          index: index,
                          uid: snapshot.data.documents[index]['userID'],
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
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Text(
                                    '${snapshot.data.documents[index]['title']}',
                                    maxLines: 2,
                                    overflow: TextOverflow.fade,
                                    style: GoogleFonts.openSans(
                                        color: Colors.purple[200]),
                                  ),
                                ),
                                SizedBox(height: 50),
                                PostReacts(snapshot: snapshot, index: index)
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                childCount: snapshot.data.documents.length,
              ),
            ),
    );
  }
}
