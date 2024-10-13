import 'package:flutter/material.dart';
import 'package:talky/utils/app_colors.dart';
import 'package:talky/utils/app_string.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key, required this.func});
  final Function() func;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: GestureDetector(
          onTap: func,
          child: const Text(
            AppString.forgotPassword,
            style: TextStyle(
              color: AppColors.blackText,
              fontSize: 12,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ),
    );
  }
}