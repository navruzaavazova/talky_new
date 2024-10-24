import 'package:flutter/material.dart';

class ItemsCircle extends StatelessWidget {
  final Function() func;
  final Widget icon;
  final Color backgroundColor;

  const ItemsCircle({
    super.key,
    required this.func,
    required this.icon,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 8,
            spreadRadius: 2,
          ),
        ],
      ),
      child: IconButton(
        onPressed: func,
        icon: icon,
        iconSize: 30,
        splashRadius: 30,
        padding: const EdgeInsets.all(8),
        constraints: const BoxConstraints(
          minWidth: 60,
          minHeight: 60,
        ),
      ),
    );
  }
}
