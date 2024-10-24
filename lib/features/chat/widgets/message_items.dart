import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:talky/utils/app_colors.dart';

class MessageItems extends StatelessWidget {
  const MessageItems({
    super.key,
    required this.document,
    required this.previousMessage,
  });
  final DocumentSnapshot document;
  final DocumentSnapshot? previousMessage;

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;
    var isCurrentUser = data['senderId'] == auth.currentUser!.uid;

    final currentMessageTime = (data['time'] as Timestamp).toDate();
    final DateTime? previousMessageTime = previousMessage != null
        ? (previousMessage!['time'] as Timestamp).toDate()
        : null;

    bool showTime = previousMessageTime == null ||
        currentMessageTime.difference(previousMessageTime).inMinutes > 1;
    return Column(
      children: [
        if (showTime)
          Center(
            child: Text(
              '${currentMessageTime.hour}: ${currentMessageTime.minute}',
              style: const TextStyle(
                color: AppColors.lightBlack,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        const SizedBox(
          height: 15,
        ),
        Align(
          alignment:
              isCurrentUser ? Alignment.centerRight : Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(
              bottom: 15,
            ),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: isCurrentUser
                    ? AppColors.primaryBlue
                    : AppColors.lightBackground,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                data['message'],
                style: TextStyle(
                  color: isCurrentUser ? Colors.white : Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
