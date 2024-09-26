import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:talky_new/utils/app_colors.dart';
import 'package:talky_new/utils/app_icons.dart';
import 'package:talky_new/utils/app_string.dart';


class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.func, this.centerText = '',
  });
  final Function() func;
  final String centerText;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 26),
        child: Row(
          children: [
            GestureDetector(
              onTap: func,
              child: Container(
                height: 24,
                width: 24,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.secondaryBlue,
                ),
                child: SvgPicture.asset(
                  AppIcons.chevronBack.icon,
                  height: 12,
                  width: 14,
                ),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              AppString.back,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: AppColors.primaryBlue,
              ),
            ),
            Spacer(),
            Text(
              centerText,
              style: TextStyle(
                color: AppColors.blackText,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),

            Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
