import 'package:flutter/material.dart';
import 'package:flutter_game_module/config/constants.dart';
import 'package:flutter_game_module/model/assets_model.dart';
import 'package:flutter_game_module/shared/widgets/drag_target_widget.dart';

class TimeTravelTargetWidget extends StatelessWidget {
  final List<String> images;
  final ValueNotifier resetNotifier;
  final Function(String target, DragTargetDetails<AssetsModel> detail)
      onTargetAccept;

  const TimeTravelTargetWidget({
    super.key,
    required this.resetNotifier,
    required this.onTargetAccept,
    required this.images,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Wrap(
      alignment: WrapAlignment.center,
      runAlignment: WrapAlignment.center,
      direction: Axis.horizontal,
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 8,
      runSpacing: 8,
      children: [
        //o index é o valor que espera do target em String
        for (int i = 0; i < images.length; i++)
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: size.width / 6.5,
                height: size.height / 3.9,
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
    );
  }
}
