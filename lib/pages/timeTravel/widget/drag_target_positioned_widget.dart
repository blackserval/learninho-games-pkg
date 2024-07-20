// import 'package:flutter/material.dart';
// import 'package:flutter_game_module/model/assets_model.dart';
// import 'package:flutter_game_module/shared/widgets/circle_widget.dart';

// class DragTargetPositionedWidget extends StatefulWidget {
//   final double? top;
//   final double? left;
//   final double? right;
//   final double? bottom;
//   final String targetValue;
//   final Function(DragTargetDetails<AssetsModel>) onAcceptItem;
//   final Color backgroundColor;
//   //Usado para o widget pai resetar os filhos
//   final ValueNotifier resetNotifier;

//   const DragTargetPositionedWidget({
//     super.key,
//     this.top,
//     this.left,
//     this.right,
//     this.bottom,
//     required this.targetValue,
//     required this.onAcceptItem,
//     required this.backgroundColor,
//     required this.resetNotifier,
//   });

//   @override
//   State<DragTargetPositionedWidget> createState() =>
//       _DragTargetPositionedWidgetState();
// }

// class _DragTargetPositionedWidgetState
//     extends State<DragTargetPositionedWidget> {
//   AssetsModel? dataReceived;

//   @override
//   void initState() {
//     widget.resetNotifier.addListener(reset);
//     super.initState();
//   }

//   @override
//   void dispose() {
//     widget.resetNotifier.removeListener(reset);
//     super.dispose();
//   }

//   reset() {
//     setState(() => dataReceived = null);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Positioned(
//       top: widget.top,
//       left: widget.left,
//       right: widget.right,
//       bottom: widget.bottom,
//       child: DragTarget<AssetsModel>(
//         builder: (context, candidateData, rejectedData) {
//           return CircleWidget(
//             color: widget.backgroundColor,
//             image: dataReceived?.url,
//             size: const Size(65, 65),
//           );
//         },
//         onWillAcceptWithDetails: (details) {
//           return true;
//           // if (details.data['value'] == widget.targetValue) {
//           //   return true;
//           // }
//         },
//         onAcceptWithDetails: (details) {
//           setState(() => dataReceived = details.data);
//           widget.onAcceptItem(details);
//         },
//       ),
//     );
//   }
// }
