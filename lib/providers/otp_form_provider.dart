import 'package:email_otp/email_otp.dart';
import 'package:flutter/material.dart';
import 'package:talky_new/utils/app_string.dart';

class OtpFormProvider extends ChangeNotifier {
  bool isCorrect = true;
  int currentIndex = -1;
  List<String> code = [];

  Future<bool> sentEmail({required String email}) async {
    EmailOTP.config(
      appEmail: AppString.appMail,
      appName: AppString.appName,
      otpLength: 4,
      otpType: OTPType.numeric,
    );
    return await EmailOTP.sendOTP(email: email);
  }

  bool verifyEmail({required String pin}) {
    return EmailOTP.verifyOTP(otp: pin);
  }

  void toList(List<TextEditingController> controllers) {
    code = controllers.map((controller) => controller.text).toList();
  }

  void checkResult(bool otp) {
    isCorrect = otp;
    notifyListeners();
  }
}
