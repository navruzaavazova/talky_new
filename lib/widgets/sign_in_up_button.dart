import 'package:flutter/material.dart';
import 'package:talky_new/utils/app_colors.dart';

class SignInUpButton extends StatelessWidget {
  const SignInUpButton({
    super.key,
    required this.text, required this.isPressed, required this.func,
  });
  final String text;
  final bool isPressed;
  final Function() func;

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: 54,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryBlue,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: func,
        child: !isPressed
            ? Text(
                text,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              )
            : SizedBox(
                height: 24,
                width: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  color: Colors.white,
                ),
              ),
      ),
    );
  }
}
