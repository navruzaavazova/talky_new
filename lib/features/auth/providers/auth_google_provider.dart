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
      final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
      if (gUser != null) {
        final GoogleSignInAuthentication gAuth = await gUser.authentication;
        final cred = GoogleAuthProvider.credential(
          accessToken: gAuth.accessToken,
          idToken: gAuth.idToken,
        );
        UserCredential userCredential = await auth.signInWithCredential(cred);
        User? userGoogle = userCredential.user;
        String? email = userGoogle?.email;

        final getEmail = await firebaseStore
            .collection('users')
            .where('email', isEqualTo: email)
            .get();
        if (getEmail.docs.isEmpty) {
          User? user = auth.currentUser;
          final doc = firebaseStore.collection('users').doc(user!.uid);
          await doc.set({
            'email': email,
          });
        }
        _updateState(Statuses.completed);
        notifyListeners();
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
