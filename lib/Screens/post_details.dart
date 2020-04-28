import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nav_router/nav_router.dart';
import 'package:provider/provider.dart';
import 'package:timeline_list/timeline.dart';
import 'package:timeline_list/timeline_model.dart';
import 'package:volcano/Components/PostsComponents/comment_modal.dart';
import 'package:volcano/Provider/PostsBloc/posts_bloc.dart';
import 'package:volcano/Utils/spiner.dart';

class PostDetails extends StatelessWidget {
  final int index;
  final AsyncSnapshot snapshot;
  PostDetails({@required this.index, @required this.snapshot});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Text('Detailed info'),
        ),
        leading: GestureDetector(
          onTap: () => pop(),
          child: Icon(Icons.arrow_back_ios, color: Colors.purple[300]),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: SelectableText(
                    "${snapshot.data.documents[index]['title']}",
                    style: GoogleFonts.openSans(
                      color: Colors.purple[100],
                      fontWeight: FontWeight.w200,
                      fontSize: 40,
                      letterSpacing: 1.3,
                    ),
                  ),
                ),
              ),
              Divider(thickness: 6),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: SelectableText(
                    "${snapshot.data.documents[index]['description']}",
                    cursorColor: Colors.purple[100],
                    showCursor: true,
                    toolbarOptions: ToolbarOptions(selectAll: true, copy: true),
                    style: GoogleFonts.openSans(
                      color: Colors.white70,
                      fontWeight: FontWeight.w500,
                      fontSize: 22,
                      letterSpacing: 1.3,
                    ),
                  ),
                ),
              ),
              Divider(thickness: 3),
              Column(
                children: <Widget>[
                  IconButton(
                    onPressed: () => showModalBottomSheet(
                        context: context,
                        builder: (_) => CommentModal(
                            postID: snapshot.data.documents[index].documentID)),
                    icon: FaIcon(FontAwesomeIcons.commentAlt,
                        color: Colors.purple[400]),
                  ),
                  Text('Comment'),
                  SizedBox(height: 30),
                  Consumer<PostsBloc>(
                    builder: (_, _bloc, __) => StreamBuilder(
                      stream: _bloc.getAllComments(
                          snapshot.data.documents[index].documentID),
                      builder: (_, snapshot) => !snapshot.hasData
                          ? Spinner(
                              firstColor: Colors.purple[100],
                              secondColor: Colors.amber[100],
                            )
                          : Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height,
                              child: Timeline.builder(
                                itemCount: snapshot.data.documents.length,
                                lineColor: Colors.amber[100],
                                iconSize: 29,
                                position: TimelinePosition.Left,
                                itemBuilder: (_, int index) => TimelineModel(
                                  GestureDetector(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Padding(
                                        padding: const EdgeInsets.all(18.0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white12,
                                            ),
                                            child: Text(
                                              '${snapshot.data.documents[index]['comment']}',
                                              style: GoogleFonts.openSans(
                                                color: Colors.amber[100],
                                                fontWeight: FontWeight.w500,
                                                fontSize: 19,
                                                letterSpacing: 1.3,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  iconBackground: Colors.transparent,
                                  icon: Icon(
                                    Icons.comment,
                                    color: Colors.purple[100],
                                  ),
                                ),
                              ),
                            ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
