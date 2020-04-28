import 'package:flutter/material.dart';
import 'package:volcano/Components/ArticlesComponents/all_articles.dart';

class Articles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        cacheExtent: 8,
        slivers: <Widget>[
          SliverAppBar(
            elevation: 3,
            snap: true,
            floating: true,
            centerTitle: true,
            automaticallyImplyLeading: false,
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
          ),
          AllArticles()
        ],
      ),
    );
  }
}
