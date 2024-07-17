import 'package:flutter/material.dart';
import 'package:flutter_game_module/config/constants.dart';
import 'package:flutter_game_module/shared/widgets/drag_target_widget.dart';

class TargetGridWidget extends StatelessWidget {
  final ValueNotifier resetNotifier;
  final Function(String target, DragTargetDetails<Map<String, dynamic>> detail)
      onTargetAccept;

  const TargetGridWidget({
    super.key,
    required this.resetNotifier,
    required this.onTargetAccept,
  });

  @override
  Widget build(BuildContext context) {
    final appBarHeight = AppBar().preferredSize.height;
    final size = MediaQuery.of(context).size;
    final availableHeight = size.height - appBarHeight - 16;

    return SizedBox(
      height: availableHeight,
      width: 300,
      child: GridView(
        // physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 0,
          mainAxisSpacing: 0,
        ),
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Image.network('https://via.placeholder.com/150x150'),
              DragTargetWidget(
                targetValue: '0',
                onAcceptItem: (detail) => onTargetAccept('0', detail),
                resetNotifier: resetNotifier,
                widgetType: WidgetType.circle,
                backgroundColor: Colors.green,
              ),
            ],
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Image.network('https://via.placeholder.com/150x150'),
              DragTargetWidget(
                targetValue: '1',
                onAcceptItem: (detail) => onTargetAccept('1', detail),
                resetNotifier: resetNotifier,
                widgetType: WidgetType.circle,
                backgroundColor: Colors.black,
              ),
            ],
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Image.network('https://via.placeholder.com/150x150'),
              DragTargetWidget(
                targetValue: '2',
                onAcceptItem: (detail) => onTargetAccept('2', detail),
                resetNotifier: resetNotifier,
                widgetType: WidgetType.circle,
                backgroundColor: Colors.pink,
              ),
            ],
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Image.network('https://via.placeholder.com/150x150'),
              DragTargetWidget(
                targetValue: '3',
                onAcceptItem: (detail) => onTargetAccept('3', detail),
                resetNotifier: resetNotifier,
                widgetType: WidgetType.circle,
                backgroundColor: Colors.red,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
