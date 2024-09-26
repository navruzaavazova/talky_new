import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:talky_new/models/user_data_model.dart';

class FirebaseProvider extends ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firebaseStore = FirebaseFirestore.instance;
  String newPasswordInvalid = '';
  String passwordInvalid = '';
  String forgotPasswordInvalid = '';
  bool isSignUpCorrect = true;
  bool isSignInCorrect = true;
  bool isForgotPassword = true;
  bool isComplete = true;
  bool isGoogleSignInSuccessful = false;

  // Sign In
  Future<bool> authByEmail({
    required String email,
    required String password,
  }) async {
    bool isCorrect = false;
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      isCorrect = true;
    } catch (e) {
      passwordInvalid = sanitizeErrorMessage(e.toString());
      notifyListeners();
    }
    return isCorrect;
  }

  // Registration
  Future<bool> registration({
    required String email,
    required String password,
  }) async {
    bool isSent = false;
    try {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      isSent = true;
    } catch (e) {
      newPasswordInvalid = sanitizeErrorMessage(e.toString());
      notifyListeners();
    }
    return isSent;
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

  // Save user data in Firestore

  Future<void> saveUserData({required UserDataModel model}) async {
    try {
      User? user = auth.currentUser;
      final doc = firebaseStore.collection('users').doc(user!.uid);
      await doc.set(model.toJson());
      notifyListeners();
    } catch (e) {
      print("Error saving user data: $e");
    }
  }

  // Forgot password
  Future<bool> forgotPassword({required String email}) async {
    try {
      forgotPasswordInvalid = '';
      notifyListeners();
      await auth.sendPasswordResetEmail(email: email);
      return true;
    } catch (e) {
      forgotPasswordInvalid = sanitizeErrorMessage(e.toString());
      notifyListeners();
      return false;
    }
  }

  // Google sign-in
  Future<UserCredential?> signInGoogle() async {
    try {
      final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
      if (gUser != null) {
        final GoogleSignInAuthentication gAuth = await gUser.authentication;
        final cred = GoogleAuthProvider.credential(
          accessToken: gAuth.accessToken,
          idToken: gAuth.idToken,
        );
        isGoogleSignInSuccessful = true;
        notifyListeners();
        return await auth.signInWithCredential(cred);
      }
    } catch (e) {
      isGoogleSignInSuccessful = false;
      print("Google Sign-In failed: $e");
    }
    return null;
  }

  /// Sanitize error messages by removing extra info
  String sanitizeErrorMessage(String errorMsg) {
    String sanitized = errorMsg.replaceAll(RegExp(r'\[.*?\]'), '');
    sanitized = sanitized.replaceAll(RegExp(r'//.*'), '');
    sanitized = sanitized.replaceAll(RegExp(r'/\*.*?\*/'), '');
    return sanitized.trim();
  }

  void correctSignIn(bool isCorrect) {
    isSignInCorrect = isCorrect;
    notifyListeners();
  }

  void correctSignUp(bool isCorrect) {
    isSignUpCorrect = isCorrect;
    notifyListeners();
  }

  void forgotPass(bool isCorrect) {
    isForgotPassword = isCorrect;
    notifyListeners();
  }

  void complete(bool isCorrect) {
    isComplete = isCorrect;
    notifyListeners();
  }
}
