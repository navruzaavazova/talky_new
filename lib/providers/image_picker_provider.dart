import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class ImagePickerProvider extends ChangeNotifier {
  File? selectedImage;
  String? selectedName;
  String failedUpload = '';

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
}
