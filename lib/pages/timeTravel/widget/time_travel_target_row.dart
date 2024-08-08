import 'package:flutter/material.dart';
import 'package:flutter_game_module/config/constants.dart';
import 'package:flutter_game_module/model/assets_model.dart';
import 'package:flutter_game_module/shared/widgets/drag_target_widget.dart';

class TimeTravelTargetRow extends StatelessWidget {
  final List<String> images;
  final ValueNotifier resetNotifier;
  final Function(String target, DragTargetDetails<AssetsModel> detail)
      onTargetAccept;

  const TimeTravelTargetRow({
    super.key,
    required this.resetNotifier,
    required this.onTargetAccept,
    required this.images,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        for (int i = 0; i < images.length; i++)
          Padding(
            padding: const EdgeInsets.only(right: 24),
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: size.width / 7.5,
                  height: size.width / 7.5,
                  child: Image.asset(
                    images[i],
                    fit: BoxFit.contain,
                  ),
                ),
                DragTargetWidget(
                  targetValue: i.toString(),
                  onAcceptItem: (detail) => onTargetAccept(
                    i.toString(),
                    detail,
                  ),
                  resetNotifier: resetNotifier,
                  widgetType: WidgetType.circle,
                  // backgroundColor: Colors.green,
                ),
              ],
            ),
          ),
      ],
    );
  }
}
