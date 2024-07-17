import 'package:flutter/material.dart';

import '../../../shared/app_images.dart';
import 'drag_target_positioned_widget.dart';

class Target1Widget extends StatefulWidget {
  final ValueNotifier resetNotifier;
  final Function(String target, DragTargetDetails<Map<String, dynamic>> detail)
      onTargetAccept;

  const Target1Widget({
    super.key,
    required this.resetNotifier,
    required this.onTargetAccept,
  });

  @override
  State<Target1Widget> createState() => _Target1WidgetState();
}

class _Target1WidgetState extends State<Target1Widget> {
  final _imageKey = GlobalKey();
  Size _widgetSize = const Size(350, 350);

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_imageKey.currentContext != null) {
        final box = _imageKey.currentContext!.findRenderObject() as RenderBox;
        setState(() => _widgetSize = box.size);
        print('Widget size: ${_widgetSize.width} ${_widgetSize.height}');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Image
        Image.asset(
          key: _imageKey,
          AppImages.timeTravel1,
          fit: BoxFit.contain,
          width: 350,
          height: 350,
        ),
        // Widgets DragTarget
        DragTargetPositionedWidget(
          top: _widgetSize.height * 0.1, //27,
          left: _widgetSize.width * 0.41, //140,
          targetValue: '0',
          resetNotifier: widget.resetNotifier,
          backgroundColor: Colors.green,
          onAcceptItem: (value) => widget.onTargetAccept('0', value),
        ),
        DragTargetPositionedWidget(
          top: _widgetSize.height * 0.39, // 102,
          left: _widgetSize.width * 0.68, //65,
          targetValue: '1',
          resetNotifier: widget.resetNotifier,
          backgroundColor: Colors.red,
          onAcceptItem: (value) => widget.onTargetAccept('1', value),
        ),
        DragTargetPositionedWidget(
          bottom: _widgetSize.height * 0.10, //28,
          right: _widgetSize.width * 0.405, //142,
          targetValue: '2',
          resetNotifier: widget.resetNotifier,
          backgroundColor: Colors.blue,
          onAcceptItem: (value) => widget.onTargetAccept('2', value),
        ),
        DragTargetPositionedWidget(
          top: _widgetSize.height * 0.4, //102,
          left: _widgetSize.width * 0.13, //65,
          targetValue: '3',
          resetNotifier: widget.resetNotifier,
          backgroundColor: Colors.black,
          onAcceptItem: (value) => widget.onTargetAccept('3', value),
        ),
      ],
    );
  }
}
