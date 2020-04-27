import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:volcano/Components/ArticlesComponents/article_details.dart';
import 'package:volcano/Provider/ArticlesBloc/articles_bloc.dart';
import 'package:volcano/Utils/spiner.dart';

class AllArticles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ArticleBloc>(
      builder: (_, _bloc, __) => StreamBuilder(
        stream: _bloc.getArticles,
        builder: (_, snapshot) => snapshot.hasData
            ? SliverGrid.count(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                children: snapshot.data.documents
                    .map<Widget>(
                      (e) => GestureDetector(
                        onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (_) => ArticleDetails(data: e))),
                        child: Hero(
                          tag: '$e',
                          child: Container(
                            child: Image.network('${e['image']}'),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              )
            : SliverToBoxAdapter(child: SizedBox(child: Spinner())),
      ),
    );
  }
}
