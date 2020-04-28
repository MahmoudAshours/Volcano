import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:volcano/Models/activity_model.dart';
import 'package:volcano/Provider/AuthBloc/validators.dart';

class ActivityBloc with ChangeNotifier {
  var _userUID;
  String _imageFromNetwork;
  String description;
  File _imagePath;
  final _validation = Validators();
  var imageUploaded = UploadImage.notUploading;

  set userUID(uid) {
    _userUID = uid;
    notifyListeners();
  }

  Future<bool> uploadNewPic() async {
    try {
      String trimmedPath = basename(_imagePath.path);
      StorageReference _firebaseStorage =
          FirebaseStorage.instance.ref().child('$_userUID' + '/' + trimmedPath);
      StorageUploadTask _uploadTask = _firebaseStorage.putFile(_imagePath);
      StorageTaskSnapshot _storageSnapshot = await _uploadTask.onComplete;
      _imageFromNetwork = await _storageSnapshot.ref.getDownloadURL();
      return true;
    } catch (e) {
      return false;
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

  Future<void> writeDataFireStore(BuildContext context) {
    if (_validation.validatePost(description) && _imageFromNetwork != null) {
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
    return null;
  }

  void executeAll(context) {
    getImageFromGallery().then(
      (bool gotImage) {
        if (gotImage) {
          imageUploaded = UploadImage.uploading;
          notifyListeners();
          uploadNewPic().then(
            (bool uploaded) {
              if (uploaded) {
                imageUploaded = UploadImage.notUploading;
                notifyListeners();
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Image is uploaded successfuly!'),
                  ),
                );
              } else {
                print('error');
                imageUploaded = UploadImage.notUploading;
                notifyListeners();
              }
            },
          );
        } else {
          print('There was an error');
        }
      },
    );
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

enum UploadImage { notUploading, uploading }
