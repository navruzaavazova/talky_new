import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talky_new/providers/firebase_provider.dart';
import 'package:talky_new/providers/loading_indicator_provider.dart';
import 'package:talky_new/sign_in_mail_page.dart/widgets/forgot_password.dart';
import 'package:talky_new/sign_in_mail_page.dart/widgets/wrong_password_email.dart';

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

class SignInMailPage extends StatelessWidget {
  const SignInMailPage({super.key});

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
        child: Consumer2<LoadingProvider, FirebaseProvider>(
          builder: (context, loadProvider, firebaseProvider, child) {
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
                  AppString.signInWithEmail,
                  style: TextStyle(
                    color: AppColors.blackText,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 40),
                CustomTextForm(
                  controller: emailController,
                  hintText: AppString.enterEmail,
                  isCorrect: firebaseProvider.isSignInCorrect,
                ),
                const SizedBox(height: 18),
                CustomTextFormWithIcon(
                  controller: passwordController,
                  text: AppString.enterPassword,
                  isCorrect: firebaseProvider.isSignInCorrect,
                ),
                const SizedBox(height: 18),
                if (!firebaseProvider.isSignInCorrect)
                  WrongPasswordEmail(text: firebaseProvider.passwordInvalid),
                const SizedBox(height: 18),
                ForgotPassword(
                  func: () {
                    Navigator.pushNamed(
                      context,
                      AppRouteNames.forgotPasswordPage,
                    );
                  },
                ),
                const SizedBox(height: 168),
                SignInUpButton(
                  text: AppString.signIn,
                  isPressed: loadProvider.isMailSignIn,
                  func: () async {
                    loadProvider.changeState(AuthMode.isMailSignIn);
                    bool isAuthCorrect = await firebaseProvider.authByEmail(
                        email: emailController.text,
                        password: passwordController.text);
                    firebaseProvider.correctSignIn(
                      isAuthCorrect,
                    );
                    if (isAuthCorrect) {
                      // ignore: use_build_context_synchronously
                      Navigator.pushNamed(context, AppRouteNames.profilePage);
                    }
                    loadProvider.changeState(
                      AuthMode.isMailSignIn,
                    );
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                FloorText(
                  text1: AppString.dontHaveAccount,
                  text2: AppString.signUpHere,
                  func: () {
                    Navigator.pushNamed(
                      context,
                      AppRouteNames.signUpPage,
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
