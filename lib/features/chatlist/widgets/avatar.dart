import 'package:flutter/material.dart';
import 'package:talky/utils/app_colors.dart';

class Avatar extends StatelessWidget {
  const Avatar({
    super.key,
    required this.bigRadius,
    required this.minHeight,
    required this.minWidth,
    required this.avatarImage,
  });
  final double bigRadius;
  final double minHeight;
  final double minWidth;
  final Widget avatarImage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: bigRadius,
          backgroundColor: AppColors.avatarColor,
          child: avatarImage,
        ),
        Positioned(
          bottom: 2,
          right: 2,
          child: Container(
            height: minHeight,
            width: minWidth,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.online,
              border: Border.fromBorderSide(
                BorderSide(
                  color: Colors.white,
                  width: 2,
                  strokeAlign: BorderSide.strokeAlignOutside,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
