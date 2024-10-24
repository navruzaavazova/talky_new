import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:talky/core/ui_kit/avatar.dart';
import 'package:talky/core/ui_kit/custom_back_button.dart';
import 'package:talky/features/chat/providers/chat_room_provider.dart';
import 'package:talky/features/chat/widgets/custom_message_send_field.dart';
import 'package:talky/features/chat/widgets/items_circle.dart';
import 'package:talky/features/chat/widgets/message_list.dart';
import 'package:talky/utils/app_colors.dart';
import 'package:talky/utils/app_icons.dart';
import 'package:talky/utils/string/chat_string.dart';

class ChatRoomPage extends StatefulWidget {
  final String receiverId;
  final String name;
  final String image;

  const ChatRoomPage({
    super.key,
    required this.receiverId,
    required this.name,
    required this.image,
  });

  @override
  _ChatRoomPageState createState() => _ChatRoomPageState();
}

class _ChatRoomPageState extends State<ChatRoomPage> {
  FirebaseAuth auth = FirebaseAuth.instance;
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        toolbarHeight: 70,
        title: Row(
          children: [
            CustomBackButton(func: () {
              Navigator.pop(context);
            }),
            const Expanded(
              child: Center(
                child: Text(
                  'Your name',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
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
            const SizedBox(
              width: 20,
            )
          ],
        ),
      ),
      body: ChangeNotifierProvider(
        create: (context) => ChatRoomProvider(),
        child: Consumer<ChatRoomProvider>(
          builder: (context, value, child) {
            final currentUserId = auth.currentUser!.uid;
            return Padding(
              padding: const EdgeInsets.only(
                left: 28,
                right: 28,
                bottom: 30,
              ),
              child: Column(
                children: [
                  Expanded(
                    child: MessageList(
                      stream: value.getMessages(
                        widget.receiverId,
                        currentUserId,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        child: CustomMessageSendField(
                          hintText: ChatString.message,
                          controller: _messageController,
                          isFocus: true,
                          func: () async {
                            if (_messageController.text.isNotEmpty) {
                              await value.sendMessage(
                                widget.receiverId,
                                _messageController.text,
                              );
                              _messageController.clear();
                            }
                          },
                          iconTextField: AppIcons.sendMessage.icon,
                        ),
                      ),
                      const SizedBox(width: 8),
                      ItemsCircle(
                        func: () {},
                        icon: SvgPicture.asset(AppIcons.moreAttachment.icon),
                        backgroundColor: AppColors.primaryBlue,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 31,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
