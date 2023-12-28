import 'package:flutter/material.dart';

class NewMessage extends StatefulWidget {
  const NewMessage({super.key});

  @override
  State<NewMessage> createState() {
    return _NewMessageState();
  }
}

class _NewMessageState extends State<NewMessage> {
  var _messageController = TextEditingController();

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  void _submitMessage() {
    final enteredMessage = _messageController.text;

    if(enteredMessage.trim().isEmpty) {
      return;
    }

    //send message to db 

    _messageController.clear(); // to reset input
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 15,
        right: 1,
        bottom: 12,
      ),
      child: Row(children: [
        Expanded(
          child: TextField(
            controller: _messageController,
            textCapitalization: TextCapitalization.sentences,
            autocorrect: true,
            enableSuggestions: true,
            decoration: InputDecoration(labelText: 'Send a message...'),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.send),
          color: Theme.of(context).colorScheme.primary,
          onPressed: _submitMessage,
        ),
      ]),
    );
  }
}
