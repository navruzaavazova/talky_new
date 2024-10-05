import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:talky/features/profile/models/user_data_model.dart';
import 'package:talky/utils/statuses.dart';

class CreateProfileProvider extends ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;

  FirebaseFirestore firebaseStore = FirebaseFirestore.instance;

  Statuses _state = Statuses.initial;
  Statuses get state => _state;

  File? selectedImage;
  String? selectedName;
  String failedUpload = '';
  String errorText = '';

  Future<void> imagePicker() async {
    if (await Permission.storage.request().isGranted) {
      try {
        FilePickerResult? res = await FilePicker.platform.pickFiles(
          type: FileType.image,
        );
        if (res != null && res.files.single.path != null) {
          selectedImage = File(res.files.single.path!);

          notifyListeners();
        }
      } catch (e) {
        failedUpload = e.toString();
      }
    } else {
      print("Permission denied");
    }
  }

  Future<String?> imageUpload(File selectedImage) async {
    FirebaseStorage storage = FirebaseStorage.instance;
    final imageRef = storage
        .ref()
        .child('profile_image/${DateTime.now().microsecondsSinceEpoch}.jpg');

    final imageRefe = await imageRef.putFile(selectedImage);
    final imageDownload = await imageRefe.ref.getDownloadURL();

    notifyListeners();

    return imageDownload;
  }

  Future<void> saveUserData({required UserDataModel model}) async {
    _state = Statuses.loading;
    try {
      User? user = auth.currentUser;
      final doc = firebaseStore.collection('users').doc(user!.uid);
      await doc.set(model.toJson());
      _updateState(Statuses.completed);
      notifyListeners();
    } catch (e) {
      _updateState(Statuses.error);
      errorText = "Error saving user data: $e";
    }
  }

  void _updateState(Statuses value) {
    _state = value;
    notifyListeners();
  }
}
