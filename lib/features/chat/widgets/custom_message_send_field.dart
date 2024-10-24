import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:talky/utils/app_colors.dart';

class CustomMessageSendField extends StatefulWidget {
  const CustomMessageSendField({
    Key? key,
    required this.hintText,
    required this.controller,
    required this.isFocus,
    required this.func,
    required this.iconTextField,
  }) : super(key: key);

  final String hintText;
  final TextEditingController controller;
  final bool isFocus;
  final Function() func;
  final String iconTextField;

  @override
  State<CustomMessageSendField> createState() => _CustomMessageSendFieldState();
}

class _CustomMessageSendFieldState extends State<CustomMessageSendField> {
  late final FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    widget.controller.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    _focusNode.dispose();
    widget.controller.removeListener(_onTextChanged);
    super.dispose();
  }

  void _onTextChanged() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 15, top: 15, bottom: 13),
      height: 54,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: widget.controller.text.isEmpty
              ? AppColors.lightBlack
              : AppColors.primaryBlue,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              focusNode: _focusNode,
              controller: widget.controller,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: widget.hintText,
                hintStyle: const TextStyle(
                  color: AppColors.lightBlack,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              style: const TextStyle(
                color: AppColors.blackText,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          GestureDetector(
            onTap: widget.func,
            child: SvgPicture.asset(
              widget.iconTextField,
              height: 24,
              width: 24,
            ),
          ),
        ],
      ),
    );
  }
}
