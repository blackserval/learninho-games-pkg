import 'package:flutter/material.dart';
import 'package:flutter_game_module/model/assets_model.dart';
import 'package:flutter_game_module/shared/shape/circle_widget.dart';
import 'package:flutter_game_module/shared/shape/rectangle_widget.dart';

import '../../config/constants.dart';
import '../shape/square_widget.dart';

class DraggableWidget extends StatelessWidget {
  final Map<String, String?> targets;
  final AssetsModel item;
  final double radius;
  final WidgetType widgetType;
  final Color? color;

  const DraggableWidget({
    super.key,
    required this.targets,
    required this.item,
    this.radius = 40,
    required this.widgetType,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    bool contain = targets.values.contains(item.value.toString());

    return Draggable<AssetsModel>(
      data: item,
      feedback: switch (widgetType) {
        WidgetType.circle => CircleWidget(image: item.url, color: color),
        WidgetType.rectangle => RectangleWidget(image: item.url, color: color),
        WidgetType.square => SquareWidget(image: item.url, color: color),
      },
      childWhenDragging: switch (widgetType) {
        WidgetType.circle => const CircleWidget(color: Colors.grey),
        WidgetType.rectangle => const RectangleWidget(color: Colors.grey),
        WidgetType.square => const SquareWidget(color: Colors.grey),
      },
      child: contain
          ? const SizedBox.shrink()
          : switch (widgetType) {
              WidgetType.circle => CircleWidget(image: item.url, color: color),
              WidgetType.rectangle =>
                RectangleWidget(image: item.url, color: color),
              WidgetType.square => SquareWidget(image: item.url, color: color),
            },
    );
  }
}
