import 'package:flutter/material.dart';
import 'package:flutter_game_module/shared/widgets/circle_widget.dart';
import 'package:flutter_game_module/shared/widgets/rectangle_widget.dart';
import 'package:haptic_feedback/haptic_feedback.dart';

import '../../config/constants.dart';
import '../../helper/haptic_helper.dart';

class DraggableWidget extends StatelessWidget {
  final Map<String, String?> targets;
  final Map<String, dynamic> item;
  final double radius;
  final WidgetType widgetType;

  const DraggableWidget({
    super.key,
    required this.targets,
    required this.item,
    this.radius = 40,
    required this.widgetType,
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
        feedback: switch (widgetType) {
          WidgetType.circle => CircleWidget(image: item['url']),
          WidgetType.rectangle => RectangleWidget(image: item['url']),
          WidgetType.square => RectangleWidget(image: item['url']),
        },
        childWhenDragging: switch (widgetType) {
          WidgetType.circle => const CircleWidget(color: Colors.grey),
          WidgetType.rectangle => const RectangleWidget(color: Colors.grey),
          WidgetType.square => const RectangleWidget(color: Colors.grey),
        },
        child: contain
            ? const SizedBox.shrink()
            : switch (widgetType) {
                WidgetType.circle => CircleWidget(image: item['url']),
                WidgetType.rectangle => RectangleWidget(image: item['url']),
                WidgetType.square => RectangleWidget(image: item['url']),
              },
      ),
    );
  }
}
