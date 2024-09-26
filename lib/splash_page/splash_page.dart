import 'package:flutter/material.dart';
import 'package:talky_new/utils/app_colors.dart';
import 'package:talky_new/utils/app_route_names.dart';
import 'package:talky_new/widgets/text_talky.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
        const Duration(seconds: 5),
        () => {
              Navigator.pushNamed(
                context,
                AppRouteNames.signInPage,
              )
            });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xff377DFF),
      body: Center(
        child: TextTalky(
          textSize: 80,
          textColor: Colors.white,
          dotColor: AppColors.blackText,
        ),
      ),
    );
  }
}
