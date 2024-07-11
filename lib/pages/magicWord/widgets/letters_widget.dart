import 'package:flutter/material.dart';

import '../../../shared/widgets/draggable_widget.dart';

class LettersWidget extends StatelessWidget {
  final List<Map<String, String>> letters;
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
        spacing: 16,
        runSpacing: 16,
        runAlignment: WrapAlignment.center,
        alignment: WrapAlignment.center,
        children: letters
            .map((e) => DraggableWidget(
                  targets: targets,
                  item: e,
                  radius: 30,
                ))
            .toList(),
      ),
    );
  }
}
