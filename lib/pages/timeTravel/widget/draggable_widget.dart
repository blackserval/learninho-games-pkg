import 'package:flutter/material.dart';
import 'package:haptic_feedback/haptic_feedback.dart';

import '../../../helper/haptic_helper.dart';

class DraggableWidget extends StatelessWidget {
  final Map<String, dynamic> score;
  final Map<String, dynamic> item;

  const DraggableWidget({
    super.key,
    required this.score,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Draggable<Map<String, dynamic>>(
        data: item,
        onDragStarted: () {
          HapticHelper.vibrate(HapticsType.selection);
        },
        feedback: CircleAvatar(
          backgroundImage: NetworkImage(item['url']!),
          radius: 45,
        ),
        childWhenDragging: const CircleAvatar(
          backgroundColor: Colors.grey,
        ),
        child: score[item['value']] == true
            ? const Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 80,
              )
            : CircleAvatar(
              radius: 40,
                backgroundImage: NetworkImage(item['url']!),
              ),
      ),
    );
  }
}
