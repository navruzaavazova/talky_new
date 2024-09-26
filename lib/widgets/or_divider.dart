import 'package:flutter/material.dart';
import 'package:talky_new/utils/app_colors.dart';
import 'package:talky_new/utils/app_string.dart';


class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 32),
      child: Row(
        children: [
          Expanded(
            child: Divider(
              color: AppColors.dividerBlack,
              height: 1,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Text(
              AppString.or,
              style: TextStyle(
                color: AppColors.dividerBlack,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            child: Divider(
              color: AppColors.dividerBlack,
              height: 1,
            ),
          ),
        ],
      ),
    );
  }
}
