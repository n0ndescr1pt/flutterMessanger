import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final DateTime datetime;
  final CrossAxisAlignment crossAxisAlignment;

  const ChatBubble({super.key, required this.message, required this.datetime, required this.crossAxisAlignment});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: Colors.blue),
      child: Column(
        crossAxisAlignment: crossAxisAlignment,
        children: [
          Text(message,
              style: const TextStyle(fontSize: 16, color: Colors.white)),
          Text(
            DateFormat('HH:mm').format(datetime),
            style: const TextStyle(fontSize: 12),
          )
        ],
      ),
    );
  }
}
