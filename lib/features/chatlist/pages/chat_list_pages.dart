import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:talky/features/chatlist/widgets/avatar.dart';
import 'package:talky/utils/app_colors.dart';
import 'package:talky/utils/app_icons.dart';
import 'package:talky/utils/app_string.dart';

class ChatListPages extends StatelessWidget {
  const ChatListPages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Avatar(
              bigRadius: 25,
              minHeight: 12,
              minWidth: 12,
              avatarImage: SvgPicture.asset(
                AppIcons.userIcon.icon,
                width: 20,
                height: 20,
              ),
            ),
            const Spacer(),
            const Text(
              AppString.chats,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(),
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                AppIcons.search.icon,
                height: 24,
                width: 24,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 25),
        child: Stack(
          children: [
            ListView(
              children: [

              ],
            ),
            Positioned(
              bottom: 46,
              right: 28,
              child: IconButton(
                onPressed: () {},
                style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                    AppColors.primaryBlue,
                  ),
                  shape: WidgetStatePropertyAll(
                    CircleBorder(),
                  ),
                ),
                iconSize: 40,
                icon: SvgPicture.asset(
                  AppIcons.floatingMenu.icon,
                ),
                constraints: const BoxConstraints.tightFor(
                  height: 80,
                  width: 80,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
