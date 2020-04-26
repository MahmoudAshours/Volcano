import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:volcano/Models/comment_model.dart';
import 'package:volcano/Models/post_model.dart';
import 'package:volcano/Provider/AuthBloc/validators.dart';

class PostsBloc with ChangeNotifier {
  final _validator = Validators();
  String _uid;
  String title;
  String description;
  String comment;

  set uid(uid) {
    _uid = uid;
    notifyListeners();
  }

  Stream get allPosts => _getAllPosts();

  Future<DocumentReference> addUsersPosts(context) async {
    if (_validator.validatePost(title) &&
        _validator.validatePost(description)) {
      final _postsModel = PostsModel(title: title, description: description);
      Firestore.instance
          .collection('posts')
          .document()
          .setData(_postsModel.toJSON(_uid))
          .then(
        (_) {
          title = null;
          description = null;
          Navigator.of(context).pop();
        },
      );
    }
    return null;
  }

  Future<DocumentReference> addComment(context, postId) async {
    if (_validator.validatePost(comment)) {
      final _commentModel = CommentModel(comment: comment, userID: _uid);
      Firestore.instance
          .collection('posts')
          .document(postId)
          .collection("comments")
          .add(_commentModel.toJSON())
          .then(
        (_) {
          comment = null;
          Navigator.of(context).pop();
        },
      );
    }
    return null;
  }

  Stream<QuerySnapshot> getUserPosts({userID}) {
    print(userID);
    return Firestore.instance
        .collectionGroup('posts')
        .where('userID', isEqualTo: userID ?? '$_uid')
        .snapshots();
  }

  Stream<QuerySnapshot> _getAllPosts() {
    return Firestore.instance
        .collection('posts')
        .orderBy('time', descending: true)
        .snapshots();
  }

  Stream<QuerySnapshot> getAllComments(postID) {
    return Firestore.instance
        .collection('posts')
        .document(postID)
        .collection('comments')
        .snapshots();
  }

  Future addHandShake(postRef) async {
    await Firestore.instance.runTransaction(
      (transactionHandler) async {
        DocumentSnapshot freshSnap = await transactionHandler.get(postRef);
        await transactionHandler.update(
          freshSnap.reference,
          {'handshakes': freshSnap['handshakes'] + 1},
        );
      },
    );
  }
}
