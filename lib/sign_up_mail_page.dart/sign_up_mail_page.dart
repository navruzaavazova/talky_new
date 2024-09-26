import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talky_new/providers/firebase_provider.dart';
import 'package:talky_new/providers/loading_indicator_provider.dart';
import 'package:talky_new/providers/otp_form_provider.dart';
import 'package:talky_new/sign_in_mail_page.dart/widgets/wrong_password_email.dart';
import 'package:talky_new/sign_up_mail_otp_page.dart/sign_up_mail_otp_page.dart';
import 'package:talky_new/sign_up_mail_page.dart/widgets/check_agreement.dart';
import 'package:talky_new/utils/app_colors.dart';
import 'package:talky_new/utils/app_route_names.dart';
import 'package:talky_new/utils/app_string.dart';
import 'package:talky_new/utils/auth_mode.dart';
import 'package:talky_new/widgets/custom_app_bar.dart';
import 'package:talky_new/widgets/custom_text_form.dart';
import 'package:talky_new/widgets/custom_text_form_with_icon.dart';
import 'package:talky_new/widgets/floor_text.dart';
import 'package:talky_new/widgets/sign_in_up_button.dart';
import 'package:talky_new/widgets/text_talky.dart';

class SignUpMailPage extends StatelessWidget {
  const SignUpMailPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      appBar: CustomAppBar(
        func: () {
          Navigator.pop(context);
        },
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28),
        child: Consumer3<LoadingProvider, FirebaseProvider, OtpFormProvider>(
          builder:
              (context, loadProvider, firebaseProvider, otpProvider, child) {
            return Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 26, bottom: 40),
                  child: TextTalky(
                    textSize: 40,
                    textColor: AppColors.blackText,
                    dotColor: AppColors.primaryBlue,
                  ),
                ),
                const Text(
                  AppString.signUpEmail,
                  style: TextStyle(
                    color: AppColors.blackText,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                CustomTextForm(
                  controller: emailController,
                  hintText: AppString.enterEmail,
                  isCorrect: firebaseProvider.isSignUpCorrect,
                ),
                const SizedBox(
                  height: 18,
                ),
                CustomTextFormWithIcon(
                  controller: passwordController,
                  text: AppString.enterPassword,
                  isCorrect: firebaseProvider.isSignUpCorrect,
                ),
                const SizedBox(
                  height: 18,
                ),
                if (!firebaseProvider.isSignUpCorrect)
                  WrongPasswordEmail(
                    text: firebaseProvider.newPasswordInvalid,
                  ),
                const SizedBox(
                  height: 40,
                ),
                CheckAgreement(
                  isChooseCheck: loadProvider.isChooseCheck,
                  isChecked: loadProvider.isChecked,
                  agreement: AppString.agreement,
                  terms: AppString.terms,
                  func: (check) {
                    loadProvider.checkedCheckBox(check);
                  },
                ),
                const SizedBox(
                  height: 104,
                ),
                SignInUpButton(
                  text: AppString.signUp,
                  isPressed: loadProvider.isMailSignUp,
                  func: () async {
                    loadProvider.changeState(AuthMode.isMailSignUp);
                    bool isRegistered = await firebaseProvider.registration(
                      email: emailController.text,
                      password: passwordController.text,
                    );

                    firebaseProvider.correctSignUp(isRegistered);
                    if (loadProvider.isChecked == true &&
                        firebaseProvider.isSignUpCorrect) {
                      bool isSent = await otpProvider.sentEmail(
                          email: emailController.text);
                      if (isSent) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const SignUpMailOtpPage(),
                          ),
                        );
                      } else {
                        print('failed otp');
                      }
                    } else if (!loadProvider.isChecked) {
                      loadProvider.chooseCheckFunc();
                    }

                    loadProvider.changeState(
                      AuthMode.isMailSignUp,
                    );
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                FloorText(
                  text1: AppString.haveAccount,
                  text2: AppString.signInHere,
                  func: () {
                    Navigator.pushNamed(
                      context,
                      AppRouteNames.signInPage,
                    );
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
