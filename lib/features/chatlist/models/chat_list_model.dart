class ChatListModel {
  final String? name;
  final String? image;
  final String? lastMessage;
  final String? lastMessageTime;
  final String? chatRoomId;

  ChatListModel({
    this.name,
    this.image,
    this.lastMessage,
    this.lastMessageTime,
    this.chatRoomId,
  });

  factory ChatListModel.fromJson(Map<String, dynamic> json) => ChatListModel(
        name: json['name'],
        image: json['image'],
        lastMessage: json['lastMessage'],
        lastMessageTime: json['lastMessageTime'],
        chatRoomId: json['chatRoomId'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['image'] = image;
    data['lastMessage'] = lastMessage;
    data['lastMessageTime'] = lastMessageTime;
    data['chatRoomId'] = chatRoomId;
    return data;
  }
}
