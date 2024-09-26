import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talky_new/providers/otp_form_provider.dart';
import 'package:talky_new/sign_in_mail_page.dart/widgets/wrong_password_email.dart';
import 'package:talky_new/sign_up_mail_otp_page.dart/widgets/custom_code_form.dart';

import 'package:talky_new/utils/app_colors.dart';
import 'package:talky_new/utils/app_route_names.dart';
import 'package:talky_new/utils/app_string.dart';
import 'package:talky_new/widgets/custom_app_bar.dart';
import 'package:talky_new/widgets/floor_text.dart';
import 'package:talky_new/widgets/sign_in_up_button.dart';
import 'package:talky_new/widgets/text_talky.dart';

class SignUpMailOtpPage extends StatefulWidget {
  const SignUpMailOtpPage({super.key});

  @override
  State<SignUpMailOtpPage> createState() => _SignUpMailOtpPageState();
}

class _SignUpMailOtpPageState extends State<SignUpMailOtpPage> {
  int currentIndex = -1;
  final List<TextEditingController> controllers = List.generate(
    4,
    (index) => TextEditingController(),
  );

  final List<FocusNode> focusNodes = List.generate(4, (index) => FocusNode());

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < focusNodes.length; i++) {
      focusNodes[i].addListener(() {
        setState(() {
          currentIndex = i;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        func: () {
          Navigator.pop(context);
        },
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 21,
        ),
        child: Consumer<OtpFormProvider>(
          builder: (context, otpProvider, child) {
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
                  AppString.enterDigits,
                  style: TextStyle(
                    color: AppColors.blackText,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    ...List.generate(4, (index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 13, right: 13),
                        child: CustomCodeForm(
                          isCorrect: otpProvider.isCorrect,
                          controller: controllers[index],
                          isIndex: currentIndex == index,
                          focusNode: focusNodes[index],
                        ),
                      );
                    }),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                if (!otpProvider.isCorrect)
                  const WrongPasswordEmail(text: AppString.wrongOtp),
                const SizedBox(
                  height: 276,
                ),
                SignInUpButton(
                    text: AppString.signUp,
                    isPressed: false,
                    func: () {
                      otpProvider.toList(controllers);

                      bool isVerified = otpProvider.verifyEmail(
                          pin: otpProvider.code.join(''));

                      otpProvider.checkResult(isVerified);
                      if (otpProvider.isCorrect) {
                        Navigator.pushNamed(
                          context,
                          AppRouteNames.profilePage,
                        );
                      }
                    }),
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
