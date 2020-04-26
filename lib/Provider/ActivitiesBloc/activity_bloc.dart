import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:volcano/Models/activity_model.dart';

class ActivityBloc with ChangeNotifier {
  var _userUID;
  String _imageFromNetwork;
  String description;
  File _imagePath;

  set userUID(uid) {
    _userUID = uid;
    print('$uid is in activity bloc');
    notifyListeners();
  }

  Future<void> uploadNewPic() async {
    try {
      String trimmedPath = basename(_imagePath.path);
      StorageReference _firebaseStorage =
          FirebaseStorage.instance.ref().child('$_userUID' + '/' + trimmedPath);
      StorageUploadTask _uploadTask = _firebaseStorage.putFile(_imagePath);
      StorageTaskSnapshot _storageSnapshot = await _uploadTask.onComplete;
      _imageFromNetwork = await _storageSnapshot.ref.getDownloadURL();
    } catch (e) {
      print(e);
    }
  }

  Future<bool> getImageFromGallery() async {
    try {
      var _image = await ImagePicker.pickImage(source: ImageSource.gallery);
      _imagePath = _image;
      notifyListeners();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> writeDataFireStore(context) {
    final _activityModel = ActivityModel(
      image: _imageFromNetwork,
      userUID: _userUID,
      shortDescription: description,
      time: DateTime.now(),
    );
    return Firestore.instance
        .collection('activities')
        .document()
        .setData(_activityModel.toJSON())
        .then(
          (value) => {
            _imageFromNetwork = null,
            description = null,
            Navigator.of(context).pop()
          },
        );
  }

  void executeAll() {
    getImageFromGallery()
        .then((value) => value ? uploadNewPic() : print('error'));
  }

  Stream getAllActivities() {
    return Firestore.instance
        .collection('activities')
        .orderBy('time', descending: true)
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
