import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class ArticleBloc with ChangeNotifier {
  Stream<QuerySnapshot> get getArticles => _getArticles();
  Stream<QuerySnapshot> _getArticles() =>
      Firestore.instance.collection('articles').snapshots();
}
