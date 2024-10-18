import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:talky/utils/app_colors.dart';
import 'package:talky/utils/app_icons.dart';
import 'package:talky/utils/app_string.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
    required this.func,
  });
  final Function() func;
  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: func,
      label: const Text(
        AppString.back,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: AppColors.primaryBlue,
        ),
      ),
      icon: Container(
        height: 30,
        width: 30,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.secondaryBlue,
        ),
        child: SvgPicture.asset(
          AppIcons.chevronBack.icon,
          height: 12,
          width: 14,
        ),
      ),
      style: const ButtonStyle(splashFactory: NoSplash.splashFactory),
    );
  }
}
