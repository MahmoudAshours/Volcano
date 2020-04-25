import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:volcano/Models/post_model.dart';
import 'package:volcano/Provider/AuthBloc/validators.dart';

class PostsBloc with ChangeNotifier {
  final _validator = Validators();
  String _uid;
  String title;
  String description;
  set uid(uid) {
    _uid = uid;
    notifyListeners();
  }

  Stream get allPosts => _getAllPosts();

  Stream get userPosts => _getUserPosts();
  Future<DocumentReference> addUsersPosts() async {
    if (_validator.validatePost(title) &&
        _validator.validatePost(description)) {
      final _postsModel = PostsModel(title: title, description: description);
      Firestore.instance
          .collection('posts')
          .document()
          .setData(_postsModel.toJSON(_uid));
    }
    return null;
  }

  Stream _getUserPosts({userID}) {
    return Firestore.instance
        .collectionGroup('posts')
        .where('userID', isEqualTo: userID ?? '$_uid')
        .snapshots();
  }

  Stream _getAllPosts() {
    return Firestore.instance
        .collection('posts')
        .orderBy('time', descending: true)
        .snapshots();
  }
}
