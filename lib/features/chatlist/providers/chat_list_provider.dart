import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class ChatListProvider extends ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  List<Map<String, dynamic>> users = [];

  String? _userImage;
  String? get userImage => _userImage;

  Future<void> getUserImage() async {
    try {
      final currentUser = auth.currentUser;
      final querySnapshot =
          await firestore.collection('users').doc(currentUser!.uid).get();

      if (querySnapshot.exists) {
        _userImage = querySnapshot.get('image');
        notifyListeners();
      }
    } catch (e) {
      log('failed to fetch image profile: $e');
    }
  }
}
