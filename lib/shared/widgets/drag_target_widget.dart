import 'package:flutter/material.dart';
import 'package:flutter_game_module/shared/widgets/circle_widget.dart';
import 'package:flutter_game_module/shared/widgets/rectangle_widget.dart';

import '../../config/constants.dart';

class DragTargetWidget extends StatefulWidget {
  final String targetValue;
  final Function(DragTargetDetails<Map<String, dynamic>>) onAcceptItem;
  final Color backgroundColor;
  final WidgetType widgetType;
  //Usado para o widget pai resetar os filhos
  final ValueNotifier resetNotifier;

  const DragTargetWidget({
    super.key,
    required this.targetValue,
    required this.onAcceptItem,
    this.backgroundColor = Colors.transparent,
    required this.resetNotifier,
    required this.widgetType,
  });

  @override
  State<DragTargetWidget> createState() => _DragTargetWidgetState();
}

class _DragTargetWidgetState extends State<DragTargetWidget> {
  Map<String, String>? dataReceived;

  @override
  void initState() {
    widget.resetNotifier.addListener(reset);
    super.initState();
  }

  @override
  void dispose() {
    widget.resetNotifier.removeListener(reset);
    super.dispose();
  }

  void reset() {
    setState(() => dataReceived = null);
  }

  @override
  Widget build(BuildContext context) {
    return DragTarget<Map<String, String>>(
      builder: (context, candidateData, rejectedData) {
        return switch (widget.widgetType) {
          WidgetType.circle => CircleWidget(
              color: widget.backgroundColor,
              image: dataReceived?['url'],
            ),
          WidgetType.rectangle => RectangleWidget(
              color: widget.backgroundColor,
              image: dataReceived?['url'],
            ),
          WidgetType.square => RectangleWidget(
              color: widget.backgroundColor,
              image: dataReceived?['url'],
            ),
        };
      },
      onWillAcceptWithDetails: (details) {
        return true;
        // if (details.data['value'] == widget.targetValue) {
        //   return true;
        // }
      },
      onAcceptWithDetails: (details) {
        setState(() => dataReceived = details.data);
        //Retorno para o widget pai os dados que foram aceitos
        //e entraram no target
        widget.onAcceptItem(details);
      },
    );
  }
}
