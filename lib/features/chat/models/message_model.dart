import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  final String? senderId;
  final String? receiverId;
  final String? message;
  final Timestamp? time;

  MessageModel({this.senderId, this.receiverId, this.message, this.time});

  factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
        senderId: json['senderId'],
        receiverId: json['receiverId'],
        message: json['message'],
        time: json['message'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['senderId'] = senderId;
    data['receiverId'] = receiverId;
    data['message'] = message;
    data['time'] = time;
    return data;
  }
}
