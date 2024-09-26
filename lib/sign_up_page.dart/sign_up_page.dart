import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talky_new/providers/loading_indicator_provider.dart';
import 'package:talky_new/utils/app_colors.dart';
import 'package:talky_new/utils/app_icons.dart';
import 'package:talky_new/utils/app_route_names.dart';
import 'package:talky_new/utils/app_string.dart';
import 'package:talky_new/utils/auth_mode.dart';
import 'package:talky_new/widgets/custom_icon_rectangle_button.dart';
import 'package:talky_new/widgets/floor_text.dart';
import 'package:talky_new/widgets/or_divider.dart';
import 'package:talky_new/widgets/text_talky.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    var formProvider = Provider.of<LoadingProvider>(context);

    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 28,
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 71,
              ),
              const TextTalky(
                textSize: 60,
                textColor: AppColors.blackText,
                dotColor: AppColors.primaryBlue,
              ),
              const SizedBox(
                height: 230,
              ),
              CustomIconRectangleButton(
                iconPath: AppIcons.googleIcon.icon,
                text: AppString.signUpGoogle,
                func: () {
                  formProvider.changeState(
                    AuthMode.isGoogleSignUp,
                  );
                },
                isPressed: formProvider.isGoogleSignUp,
              ),
              const SizedBox(
                height: 30,
              ),
              const OrDivider(),
              const SizedBox(
                height: 30,
              ),
              CustomIconRectangleButton(
                iconPath: AppIcons.emailIcon.icon,
                text: AppString.continueEmail,
                func: () {
                  Navigator.pushNamed(
                    context,
                    AppRouteNames.signUpMailPage,
                  );
                },
                isPressed: false,
              ),
              const SizedBox(
                height: 56,
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
          ),
        ),
      ),
    );
  }
}
