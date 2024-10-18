class ChatModel {
  final String? senderId;
  final String? receiverId;
  final String? message;
  final String? time;

  ChatModel({this.senderId, this.receiverId, this.message, this.time});

  factory ChatModel.fromJson(Map<String, dynamic> json) => ChatModel(
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
