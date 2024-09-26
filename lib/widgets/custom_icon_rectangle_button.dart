import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:talky_new/utils/app_colors.dart';

class CustomIconRectangleButton extends StatelessWidget {
  const CustomIconRectangleButton({
    super.key,
    required this.iconPath,
    required this.text,
    required this.func,
    required this.isPressed,
  });
  final String iconPath;
  final String text;
  final Function() func;
  final bool isPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: func,
      child: Container(
          height: 60,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 1),
                  blurRadius: 2,
                  color: Colors.black.withOpacity(0.08),
                ),
              ]),
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 34),
          child: !isPressed
              ? Row(
                  children: [
                    SvgPicture.asset(iconPath),
                    Expanded(
                      child: Center(
                          child: Text(
                        text,
                        style: const TextStyle(
                          color: AppColors.blackText,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      )),
                    ),
                  ],
                )
              : Center(
                  child: SizedBox(
                    height: 24,
                    width: 24,
                    child: CircularProgressIndicator(
                      strokeWidth: 3,
                      color: AppColors.blackText,

                    ),
                  ),
                )),
    );
  }
}
