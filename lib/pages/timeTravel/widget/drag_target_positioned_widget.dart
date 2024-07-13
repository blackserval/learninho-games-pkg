import 'package:flutter/material.dart';

class DragTargetPositionedWidget extends StatefulWidget {
  final double? top;
  final double? left;
  final double? right;
  final double? bottom;
  final String targetValue;
  final Function(DragTargetDetails<Map<String, dynamic>>) onAcceptItem;
  final Color backgroundColor;
  //Usado para o widget pai resetar os filhos
  final ValueNotifier resetNotifier;

  const DragTargetPositionedWidget({
    super.key,
    this.top,
    this.left,
    this.right,
    this.bottom,
    required this.targetValue,
    required this.onAcceptItem,
    required this.backgroundColor,
    required this.resetNotifier,
  });

  @override
  State<DragTargetPositionedWidget> createState() =>
      _DragTargetPositionedWidgetState();
}

class _DragTargetPositionedWidgetState
    extends State<DragTargetPositionedWidget> {
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

  reset() {
    setState(() => dataReceived = null);
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: widget.top,
      left: widget.left,
      right: widget.right,
      bottom: widget.bottom,
      child: DragTarget<Map<String, String>>(
        builder: (context, candidateData, rejectedData) {
          return CircleAvatar(
            radius: 30,
            // backgroundColor: widget.backgroundColor,
            backgroundColor: Colors.transparent,
            foregroundImage: dataReceived != null
                ? NetworkImage(dataReceived!['url']!)
                : null,
          );
        },
        onWillAcceptWithDetails: (details) {
          return true;
          // if (details.data['value'] == widget.targetValue) {
          //   HapticHelper.vibrate(HapticsType.success);
          //   return true;
          // } else {
          //   HapticHelper.vibrate(HapticsType.error);
          //   return false;
          // }
        },
        onAcceptWithDetails: (details) {
          setState(() => dataReceived = details.data);
          //Retorno para o widget pai os dados que foram aceitos
          //e entraram no target
          widget.onAcceptItem(details);
        },
      ),
    );
  }
}
