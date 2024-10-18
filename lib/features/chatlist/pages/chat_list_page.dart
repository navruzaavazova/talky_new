import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:talky/features/chatlist/models/chat_list_model.dart';
import 'package:talky/core/ui_kit/avatar.dart';
import 'package:talky/features/chatlist/widgets/message_info_container.dart';
import 'package:talky/utils/app_colors.dart';
import 'package:talky/utils/app_icons.dart';
import 'package:talky/utils/app_images.dart';
import 'package:talky/utils/app_route_names.dart';
import 'package:talky/utils/app_string.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:talky/utils/string/chat_list_string.dart';

class ChatListPage extends StatefulWidget {
  const ChatListPage({super.key});

  @override
  State<ChatListPage> createState() => _ChatListPageState();
}

class _ChatListPageState extends State<ChatListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        surfaceTintColor: Colors.transparent,
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
            const Expanded(
              child: Center(
                child: Text(
                  AppString.chats,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
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
            StreamBuilder<QuerySnapshot>(
              stream:
                  FirebaseFirestore.instance.collection('users').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return const Center(child: Text(ChatListString.wentWrong));
                }
                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return const Center(child: Text(ChatListString.noUsers));
                }
                FirebaseAuth auth = FirebaseAuth.instance;
                final currentUser = auth.currentUser;
                final List<ChatListModel> users = snapshot.data!.docs
                    .where((doc) => doc['uid'] != currentUser?.uid)
                    .map((doc) => ChatListModel.fromJson(
                          doc.data() as Map<String, dynamic>,
                        ))
                    .toList();

                return ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    final user = users[index];
                    return Column(
                      children: [
                        MessageInfoContainer(
                          avatar: user.image ?? AppImages.defaultAvatar.image,
                          name: user.name ?? ChatListString.unknown,
                          lastMessage:
                              user.lastMessage ?? ChatListString.noMessages,
                          lastMessageTime: user.lastMessageTime ?? '',
                          func: () {
                            Navigator.pushNamed(
                                context, AppRouteNames.chatRoomPage,);
                          },
                          iconPath: AppIcons.chevronRight.icon,
                        ),
                        const Divider(
                          height: 1,
                          color: AppColors.dividerGrey,
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            Positioned(
              bottom: 46,
              right: 28,
              child: SizedBox(
                width: 80,
                height: 80,
                child: FloatingActionButton(
                  backgroundColor: AppColors.primaryBlue,
                  onPressed: () {},
                  shape: const CircleBorder(),
                  child: SvgPicture.asset(
                    AppIcons.floatingMenu.icon,
                    height: 40,
                    width: 40,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
