import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

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
              tag: '${data['image']}',
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
                            child: FaIcon(
                              FontAwesomeIcons.chevronLeft,
                              color: Colors.white,
                            ),
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
            child: SizedBox(
              child: SelectableText(
                '${data['title']}',
                style: GoogleFonts.openSans(
                  color: Colors.purple[100],
                  fontWeight: FontWeight.w200,
                  fontSize: 40,
                  letterSpacing: 1.3,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(child: Divider()),
          ),
          SliverPadding(padding: EdgeInsets.only(top: 20)),
          SliverToBoxAdapter(
            child: SizedBox(
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: SelectableText(
                    '${data['description']}',
                    style: GoogleFonts.openSans(
                      color: Colors.white70,
                      fontWeight: FontWeight.w500,
                      fontSize: 22,
                      letterSpacing: 1.3,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
