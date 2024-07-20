import 'package:flutter/material.dart';
import 'package:flutter_game_module/model/assets_model.dart';

import '../../../config/constants.dart';
import '../../../shared/widgets/draggable_widget.dart';

class LettersWidget extends StatelessWidget {
  final List<AssetsModel> letters;
  final Map<String, String?> targets;

  const LettersWidget({
    super.key,
    required this.letters,
    required this.targets,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width * 0.3,
      height: size.height * 0.45,
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        runAlignment: WrapAlignment.center,
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: letters
            .map((e) => DraggableWidget(
                  targets: targets,
                  item: e,
                  radius: 35,
                  widgetType: WidgetType.rectangle,
                ))
            .toList(),
      ),
    );
  }
}
