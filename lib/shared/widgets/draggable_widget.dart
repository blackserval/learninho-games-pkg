import 'package:flutter/material.dart';
import 'package:haptic_feedback/haptic_feedback.dart';

import '../../helper/haptic_helper.dart';

class DraggableWidget extends StatelessWidget {
  final Map<String, String?> targets;
  final Map<String, dynamic> item;
  final double radius;

  const DraggableWidget({
    super.key,
    required this.targets,
    required this.item,
    this.radius = 40,
  });

  @override
  Widget build(BuildContext context) {
    bool contain = targets.values.contains(item['value']);

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
        child: contain
            ? const SizedBox.shrink()
            : CircleAvatar(
                radius: radius,
                backgroundImage: NetworkImage(item['url']!),
              ),
      ),
    );
  }
}
