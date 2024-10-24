import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:talky/features/chat/models/message_model.dart';

class ChatRoomProvider extends ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  //send message
  Future<void> sendMessage(String receiverId, String message) async {
    final String currentUserId = auth.currentUser!.uid;
    final Timestamp timestamp = Timestamp.now();

    MessageModel newMessage = MessageModel(
      senderId: currentUserId,
      receiverId: receiverId,
      message: message,
      time: timestamp,
    );
    List<String> ids = [currentUserId, receiverId];
    ids.sort();
    String chatroomId = ids.join();

    await firestore
        .collection('chatRooms')
        .doc(chatroomId)
        .collection('messages')
        .add(newMessage.toJson());
  }

  Stream<QuerySnapshot> getMessages(String userId, String otherId) {
    List<String> ids = [userId, otherId];
    ids.sort();
    String chatroomId = ids.join();
    return firestore
        .collection('chatRooms')
        .doc(chatroomId)
        .collection('messages')
        .orderBy('time', descending: false)
        .snapshots();
  }
}
