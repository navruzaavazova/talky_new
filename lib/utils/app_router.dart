import 'package:flutter/material.dart';
import 'package:talky_new/forgot_password_page.dart/forgot_password_page.dart';
import 'package:talky_new/profile_page.dart/profile_page.dart';
import 'package:talky_new/sign_in_mail_page.dart/sign_in_mail_page.dart';
import 'package:talky_new/sign_in_page.dart/sign_in_page.dart';
import 'package:talky_new/sign_up_mail_otp_page.dart/sign_up_mail_otp_page.dart';
import 'package:talky_new/sign_up_mail_page.dart/sign_up_mail_page.dart';
import 'package:talky_new/sign_up_page.dart/sign_up_page.dart';
import 'package:talky_new/utils/app_route_names.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouteNames.signInPage:
        return MaterialPageRoute(
          builder: (context) => const SignInPage(),
        );
      case AppRouteNames.signInMailPage:
        return MaterialPageRoute(
          builder: (context) => const SignInMailPage(),
        );
      case AppRouteNames.signUpPage:
        return MaterialPageRoute(
          builder: (context) => const SignUpPage(),
        );
      case AppRouteNames.signUpMailPage:
        return MaterialPageRoute(
          builder: (context) => const SignUpMailPage(),
        );
      case AppRouteNames.signUpMailOtpPage:
        return MaterialPageRoute(
          builder: (context) => const SignUpMailOtpPage(),
        );
      case AppRouteNames.forgotPasswordPage:
        return MaterialPageRoute(
          builder: (context) => const ForgotPasswordPage(),
        );
      case AppRouteNames.profilePage:
        return MaterialPageRoute(
          builder: (context) => ProfilePage(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
