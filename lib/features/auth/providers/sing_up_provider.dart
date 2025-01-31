import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_otp/email_otp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:talky/utils/app_string.dart';
import 'package:talky/utils/statuses.dart';

class SingUpProvider extends ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firebaseStore = FirebaseFirestore.instance;
  Statuses _state = Statuses.initial;
  String? errorText;
  bool isChecked = false;
  bool isChooseCheck = false;

  Statuses get state => _state;

  Future<void> sentEmail(
      {required String email, required String password}) async {
    _updateState(Statuses.loading);
    try {
      final getEmail = await firebaseStore
          .collection('users')
          .where('email', isEqualTo: email)
          .get();

      if (getEmail.docs.isNotEmpty) {
        _updateState(Statuses.error);
        errorText = 'This email is already exists';
      } else {
        EmailOTP.config(
          appEmail: AppString.appMail,
          appName: AppString.appName,
          otpLength: 4,
          otpType: OTPType.numeric,
          expiry: 180000,
        );

        final isSend = await EmailOTP.sendOTP(email: email);

        if (isSend) {
          if (password.length > 6) {
            _updateState(Statuses.completed);
          } else {
            _updateState(Statuses.error);
            errorText = 'Password need to be at least 6 characters';
          }
        } else {
          _updateState(Statuses.error);
          errorText = 'Couldn\'t send OTP';
        }
      }
    } catch (e) {
      _updateState(Statuses.error);
      errorText = _sanitizeErrorMessage(e.toString());
    }
    notifyListeners();
  }

  void checkedCheckBox(bool? value) {
    isChecked = value ?? false;
    isChooseCheck = false;
    notifyListeners();
  }

  void chooseCheckFunc() {
    isChooseCheck = true;
    notifyListeners();
  }

  String _sanitizeErrorMessage(String errorMsg) {
    String sanitized = errorMsg.replaceAll(RegExp(r'\[.*?\]'), '');
    sanitized = sanitized.replaceAll(RegExp(r'//.*'), '');
    sanitized = sanitized.replaceAll(RegExp(r'/\*.*?\*/'), '');
    return sanitized.trim();
  }

  void _updateState(Statuses value) {
    _state = value;
    notifyListeners();
  }
}
