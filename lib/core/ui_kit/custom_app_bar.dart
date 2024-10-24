import 'package:flutter/material.dart';
import 'package:talky/utils/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.centerText = '',
    required this.backButton,
  });
  final Widget backButton;
  final String centerText;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: backButton,
      leadingWidth: 110,
      title: Text(
        centerText,
        style: const TextStyle(
          color: AppColors.blackText,
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
      ),
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
