import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:talky/utils/statuses.dart';

class AuthGoogleProvider extends ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firebaseStore = FirebaseFirestore.instance;
  Statuses _state = Statuses.initial;

  Statuses get state => _state;

  Future<void> signInGoogle() async {
    _updateState(Statuses.loading);
    try {
      final gSignIn = GoogleSignIn();
      if (await gSignIn.isSignedIn()) {
        await gSignIn.signOut();
      }
      final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
      if (gUser != null) {
        final GoogleSignInAuthentication gAuth = await gUser.authentication;
        final cred = GoogleAuthProvider.credential(
          accessToken: gAuth.accessToken,
          idToken: gAuth.idToken,
        );
        await auth.signInWithCredential(cred);
        _updateState(Statuses.completed);
      } else {
        _updateState(Statuses.initial);
      }
    } catch (e) {
      _updateState(Statuses.error);
      log("Google Sign-In failed: $e");
    }
  }

  void _updateState(Statuses value) {
    _state = value;
    notifyListeners();
  }
}
