import 'package:flutter/material.dart';
import 'package:talky_new/utils/auth_mode.dart';

class LoadingProvider extends ChangeNotifier {
  bool isGoogleSignIn = false;
  bool isGoogleSignUp = false;
  bool isMailSignIn = false;
  bool isMailSignUp = false;
  bool isOtpVerify = false;
  bool isForgotPassword = false;
  bool isComplete = false;

  bool isChecked = false;
  bool isChooseCheck = false;
  bool isObscureText = false;

  void changeState(AuthMode mode) {
    switch (mode) {
      case AuthMode.isGoogleSignIn:
        isGoogleSignIn = !isGoogleSignIn;
        break;
      case AuthMode.isGoogleSignUp:
        isGoogleSignUp = !isGoogleSignUp;
        break;
      case AuthMode.isMailSignIn:
        isMailSignIn = !isMailSignIn;
        break;
      case AuthMode.isMailSignUp:
        isMailSignUp = !isMailSignUp;
        break;
      case AuthMode.isOtpVerify:
        isOtpVerify = !isOtpVerify;
        break;
      case AuthMode.isForgotPassword:
        isForgotPassword = !isForgotPassword;
        break;
      case AuthMode.isComplete:
        isComplete = !isComplete;
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

  void obscureFunc() {
    isObscureText = !isObscureText;
    notifyListeners();
  }
}
