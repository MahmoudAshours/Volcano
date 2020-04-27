import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ArticleDetails extends StatelessWidget {
  final data;
  ArticleDetails({this.data});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Hero(
              tag: '$data',
              child: SafeArea(
                child: Container(
                  height: 300,
                  width: 400,
                  child: Stack(
                    children: [
                      Image.network(
                        '${data['image']}',
                        fit: BoxFit.fitHeight,
                      ),
                      SafeArea(
                        child: Material(
                          type: MaterialType.transparency,
                          child: InkWell(
                            onTap: () => Navigator.of(context).pop(),
                            child: FaIcon(FontAwesomeIcons.chevronLeft,
                                color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(child: Text('${data['title']}')),
          ),
          SliverToBoxAdapter(
            child: SizedBox(child: Divider()),
          ),
          SliverPadding(padding: EdgeInsets.only(top: 20)),
          SliverToBoxAdapter(
            child: SizedBox(child: Text('${data['description']}')),
          ),
        ],
      ),
    );
  }
}
