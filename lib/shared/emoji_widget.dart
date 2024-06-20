import 'package:flutter/material.dart';

class EmojiWidget extends StatelessWidget {
  final String emoji;

  const EmojiWidget({super.key, required this.emoji});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Text(
        emoji,
        style: const TextStyle(fontSize: 50),
      ),
    );
  }
}
