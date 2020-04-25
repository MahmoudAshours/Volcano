import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:volcano/Models/post_model.dart';

class PostsBloc with ChangeNotifier {
  final _postsModel = PostsModel();
  var _uid;
  set uid(uid) {
    _uid = uid;
    print(_uid);
    notifyListeners();
  }

  Future<DocumentReference> addUsersPosts() async {
    return await Firestore.instance
        .collection('users')
        .document(_uid)
        .collection('posts')
        .add(_postsModel.toJSON());
  }
}
