import 'package:flutter/material.dart';

class DragTargetWidget extends StatefulWidget {
  final String targetValue;
  final Function(DragTargetDetails<Map<String, dynamic>>) onAcceptItem;
  final Color backgroundColor;
  //Usado para o widget pai resetar os filhos
  final ValueNotifier resetNotifier;

  const DragTargetWidget({
    super.key,
    required this.targetValue,
    required this.onAcceptItem,
    required this.backgroundColor,
    required this.resetNotifier,
  });

  @override
  State<DragTargetWidget> createState() =>
      _DragTargetWidgetState();
}

class _DragTargetWidgetState
    extends State<DragTargetWidget> {
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
    return DragTarget<Map<String, String>>(
      builder: (context, candidateData, rejectedData) {
        return CircleAvatar(
          radius: 35,
          backgroundColor: widget.backgroundColor,
          // backgroundColor: Colors.transparent,
          backgroundImage: dataReceived != null
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
    );
  }
}
