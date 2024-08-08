import 'package:flutter/material.dart';
import 'package:flutter_game_module/config/constants.dart';
import 'package:flutter_game_module/model/assets_model.dart';
import 'package:flutter_game_module/shared/widgets/drag_target_widget.dart';

class TimeTravelTargetGrid extends StatelessWidget {
  final List<String> images;
  final ValueNotifier resetNotifier;
  final Function(String target, DragTargetDetails<AssetsModel> detail)
      onTargetAccept;

  const TimeTravelTargetGrid({
    super.key,
    required this.resetNotifier,
    required this.onTargetAccept,
    required this.images,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width / 3,
      height: size.height / 1.3,
      child: GridView.count(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        clipBehavior: Clip.none,
        children: [
          for (int i = 0; i < images.length; i++)
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: size.width / 6,
                  height: size.height / 3.4,
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
        ],
      ),
    );
  }
}
