import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MessageInfoContainer extends StatelessWidget {
  const MessageInfoContainer({
    super.key,
    required this.avatar,
    required this.name,
    required this.lastMessage,
    required this.lastMessageTime,
    required this.func,
    required this.iconPath,
  });

  final String avatar;
  final String name;
  final String lastMessage;
  final String lastMessageTime;
  final Function() func;
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipOval(
            child: Image.network(
              avatar,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.person, size: 50);
              },
            ),
          ),
          const SizedBox(width: 15),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 10),

                    Text(
                      '$lastMessageTime ago',
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),

                Text(
                  lastMessage,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ],
            ),
          ),

          IconButton(
            onPressed: func,
            icon: SvgPicture.asset(
              iconPath,
              height: 24,
              width: 24,
            ),
          ),
        ],
      ),
    );
  }
}
