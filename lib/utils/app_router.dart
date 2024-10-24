import 'package:flutter/material.dart';
import 'package:talky/features/auth/pages/forgot_password_page.dart';
import 'package:talky/features/auth/pages/sign_in_mail_page.dart';
import 'package:talky/features/auth/pages/sign_in_page.dart';
import 'package:talky/features/auth/pages/sign_up_mail_otp_page.dart';
import 'package:talky/features/auth/pages/sign_up_mail_page.dart';
import 'package:talky/features/auth/pages/sign_up_page.dart';
import 'package:talky/features/chat/pages/chat_room_page.dart';
import 'package:talky/features/chatlist/pages/chat_list_page.dart';
import 'package:talky/features/profile/pages/create_profile_page.dart';
import 'package:talky/utils/app_route_names.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments as Map<String, dynamic>?;
    switch (settings.name) {
      case AppRouteNames.signInPage:
        return MaterialPageRoute(
          builder: (context) => const SignInPage(),
        );
      case AppRouteNames.signUpPage:
        return MaterialPageRoute(
          builder: (context) => const SignUpPage(),
        );
      case AppRouteNames.signInMailPage:
        return MaterialPageRoute(
          builder: (context) => const SignInMailPage(),
        );

      case AppRouteNames.signUpMailPage:
        return MaterialPageRoute(
          builder: (context) => const SignUpMailPage(),
        );
      case AppRouteNames.signUpMailOtpPage:
        return MaterialPageRoute(
          builder: (context) => SignUpMailOtpPage(
            email: args?['email'],
            password: args?['password'],
          ),
        );
      case AppRouteNames.forgotPasswordPage:
        return MaterialPageRoute(
          builder: (context) => const ForgotPasswordPage(),
        );

      //Profiles part
      case AppRouteNames.createProfilePage:
        return MaterialPageRoute(
          builder: (context) => const CreateProfilePage(),
        );

      //Chats part
      case AppRouteNames.chatListPage:
        return MaterialPageRoute(
          builder: (context) => const ChatListPage(),
        );
      case AppRouteNames.chatRoomPage:
        return MaterialPageRoute(
          builder: (context) => ChatRoomPage(
            receiverId: args?['receiverId'],
          ),
        );


      //
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
