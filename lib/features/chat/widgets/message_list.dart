import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:talky/features/chat/widgets/message_items.dart';
import 'package:talky/utils/string/chat_list_string.dart';

class MessageList extends StatelessWidget {
  const MessageList({
    super.key,
    required this.stream,
  });
  final Stream<QuerySnapshot> stream;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: stream,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const Center(
            child: Text(
              ChatListString.noMessages,
            ),
          );
        }
        final message = snapshot.data!.docs;

        return ListView.builder(
          itemCount: message.length,
          itemBuilder: (context, index) {
            final currentMessage = message[index];
            final previousMessage = index > 0? message[index - 1]: null;

            return MessageItems(document: currentMessage, previousMessage: previousMessage,);
          },
        );
      },
    );
  }
}
