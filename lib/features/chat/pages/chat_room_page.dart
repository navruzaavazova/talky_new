import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:talky/core/ui_kit/avatar.dart';
import 'package:talky/core/ui_kit/custom_back_button.dart';
import 'package:talky/utils/app_icons.dart';

class ChatRoomPage extends StatefulWidget {
  const ChatRoomPage({
    super.key,
  });

  @override
  State<ChatRoomPage> createState() => ChatRoomPageState();
}

class ChatRoomPageState extends State<ChatRoomPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            CustomBackButton(
              func: () {
                Navigator.pop(context);
              },
            ),
            Expanded(
              child: Center(
                child: Text('Full name', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,),),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 30),
              child: Avatar(
                bigRadius: 25,
                minHeight: 12,
                minWidth: 12,
                avatarImage: SvgPicture.asset(
                  AppIcons.profileIcon.icon,
                  width: 20,
                  height: 20,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          ListView(
            children: [
            ],

            

          ),
        ],
      ),
    );
  }
}
