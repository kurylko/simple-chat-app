import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {

  // for first message 
  const MessageBubble.first(
      {super.key,
      required this.username,
      required this.userImage,
      required this.message,
      required this.isMe})
      : isFirstInSequence = true;

  const MessageBubble.next(
      {super.key, required this.message, required this.isMe})
      : isFirstInSequence = false,
        username = null,
        userImage = null;

  final bool isFirstInSequence;

  final String? userImage;

  final String? username;
  final String message;

  final bool isMe;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Stack(
      children: [
        if (userImage != null)
          Positioned(
            top: 15,
            right: isMe ? 0 : null,
            child: CircleAvatar(
              backgroundImage: NetworkImage(userImage!),
              backgroundColor: theme.colorScheme.primary.withAlpha(180),
              radius: 23,
            ),
          ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 42),
          child: Row(
            mainAxisAlignment:
                isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment:
                    isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                children: [
                  if (isFirstInSequence)
                    const SizedBox(
                      height: 16,
                    ),
                  if (username == null)
                    Padding(
                      padding: const EdgeInsets.only(left: 13, right: 13),
                      child: Text(
                        username ?? '',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black54),
                      ),
                    ),
                  Container(
                    decoration: BoxDecoration(
                      color: isMe
                          ? Colors.grey
                          : theme.colorScheme.secondary.withAlpha(180),
                      borderRadius: BorderRadius.only(
                        topLeft: !isMe && isFirstInSequence
                            ? Radius.zero
                            : const Radius.circular(12),
                        topRight: isMe && isFirstInSequence
                            ? Radius.zero
                            : const Radius.circular(12),
                        bottomLeft: const Radius.circular(12),
                        bottomRight: const Radius.circular(12),
                      ),
                    ),
                    constraints: const BoxConstraints(maxWidth: 200),
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 14),
                    margin:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                    child: Text(
                      message,
                      style: TextStyle(
                          height: 1.3,
                          color: isMe
                              ? Colors.black87
                              : theme.colorScheme.onSecondary),
                      softWrap: true,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
