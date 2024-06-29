import 'package:flutter/material.dart';
import 'package:flutter_game_module/helper/haptic_helper.dart';
import 'package:haptic_feedback/haptic_feedback.dart';

class DragTargetWidget extends StatefulWidget {
  final double? top;
  final double? left;
  final double? right;
  final double? bottom;
  final String targetValue;
  final Function(DragTargetDetails<Map<String, dynamic>>) onAcceptItem;
  final Color backgroundColor;
  //Usado para o widget pai resetar os filhos
  final ValueNotifier resetNotifier;

  const DragTargetWidget({
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

  reset() {
    print("Mudou");
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
            radius: 35,
            // backgroundColor: widget.backgroundColor,
            backgroundColor: Colors.transparent,
            backgroundImage: dataReceived != null
                ? NetworkImage(dataReceived!['url']!)
                : null,
          );
        },
        onWillAcceptWithDetails: (details) {
          if (details.data['value'] == widget.targetValue) {
            print("Received value: ${details.data['value']}");
            HapticHelper.vibrate(HapticsType.success);
            return true;
          } else {
            HapticHelper.vibrate(HapticsType.error);
            return false;
          }
        },
        onAcceptWithDetails: (details) {
          setState(() => dataReceived = details.data);
          widget.onAcceptItem(details);
        },
      ),
    );
  }
}
