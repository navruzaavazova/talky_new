import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talky_new/providers/firebase_provider.dart';
import 'package:talky_new/providers/loading_indicator_provider.dart';
import 'package:talky_new/sign_in_mail_page.dart/widgets/wrong_password_email.dart';
import 'package:talky_new/utils/app_colors.dart';
import 'package:talky_new/utils/app_route_names.dart';
import 'package:talky_new/utils/app_string.dart';
import 'package:talky_new/utils/auth_mode.dart';
import 'package:talky_new/widgets/custom_app_bar.dart';
import 'package:talky_new/widgets/custom_text_form.dart';
import 'package:talky_new/widgets/sign_in_up_button.dart';
import 'package:talky_new/widgets/text_talky.dart';


class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120),
        child: CustomAppBar(
          func: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: Consumer2<FirebaseProvider, LoadingProvider>(
          builder: (context, firebaseProvider, loadProvider, child) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 21,
                vertical: 40,
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  const TextTalky(
                    textSize: 60,
                    textColor: AppColors.blackText,
                    dotColor: AppColors.primaryBlue,
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  CustomTextForm(
                    controller: emailController,
                    hintText: AppString.enterEmail,
                    isCorrect: firebaseProvider.isForgotPassword,
                  ),
                  if (firebaseProvider.forgotPasswordInvalid.isNotEmpty)
                    SizedBox(
                      height: 30,
                      child: WrongPasswordEmail(
                          text: firebaseProvider.forgotPasswordInvalid),
                    ),
                  const SizedBox(
                    height: 30,
                  ),
                  SignInUpButton(
                      text: AppString.send,
                      isPressed: loadProvider.isForgotPassword,
                      func: () async {
                        loadProvider.changeState(AuthMode.isForgotPassword);

                        bool isSend = await firebaseProvider.forgotPassword(
                          email: emailController.text,
                        );
                        if (isSend) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Password reset email sent')),
                          );
                          Future.delayed(
                              const Duration(seconds: 5),
                              () => {
                                    Navigator.pushNamed(
                                      context,
                                      AppRouteNames.signInPage,
                                    )
                                  });
                        }

                        loadProvider.changeState(AuthMode.isForgotPassword);
                      }),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
