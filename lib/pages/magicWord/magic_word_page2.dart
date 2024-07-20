
import 'package:flutter/material.dart';
import 'package:flutter_game_module/config/constants.dart';
import 'package:flutter_game_module/model/assets_model.dart';
import 'package:flutter_game_module/shared/widgets/custom_appbar.dart';
import 'package:flutter_game_module/shared/widgets/drag_target_widget.dart';
import 'package:flutter_game_module/pages/magicWord/widgets/letters_widget.dart';

import '../../shared/theme/app_text.dart';

class MagicWordPage2 extends StatefulWidget {
  const MagicWordPage2({super.key});

  @override
  State<MagicWordPage2> createState() => _MagicWordPage2State();
}

class _MagicWordPage2State extends State<MagicWordPage2> {
  Map<String, String?> targets = {'0': null, '1': null, '2': null, '3': null};
  final resetNotifier = ValueNotifier(0);

  void resetGame() {
    resetNotifier.value++;
    setState(
      () => targets = targets.map((key, value) => MapEntry(key, null)),
    );
  }

  void onTargetAccept({
    required String target,
    required DragTargetDetails<AssetsModel> details,
  }) {
    // audio ?
    setState(() => targets[target] = details.data.value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(refreh: resetGame),
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              flex: 1,
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fitHeight,
                    image: NetworkImage(
                      'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e5/NASA_logo.svg/1224px-NASA_logo.svg.png',
                    ),
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  LettersWidget(letters: magicWordTest2, targets: targets),
                  //Targets
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    runAlignment: WrapAlignment.center,
                    alignment: WrapAlignment.center,
                    children: [
                      DragTargetWidget(
                        widgetType: WidgetType.rectangle,
                        targetValue: '0',
                        onAcceptItem: (value) => onTargetAccept(
                          target: '0',
                          details: value,
                        ),
                        backgroundColor: Colors.transparent,
                        resetNotifier: resetNotifier,
                      ),
                      DragTargetWidget(
                        widgetType: WidgetType.rectangle,
                        targetValue: '1',
                        onAcceptItem: (value) => onTargetAccept(
                          target: '1',
                          details: value,
                        ),
                        backgroundColor: Colors.transparent,
                        resetNotifier: resetNotifier,
                      ),
                      DragTargetWidget(
                        widgetType: WidgetType.rectangle,
                        targetValue: '2',
                        onAcceptItem: (value) => onTargetAccept(
                          target: '2',
                          details: value,
                        ),
                        backgroundColor: Colors.transparent,
                        resetNotifier: resetNotifier,
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: 200,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        elevation: 4,
                      ),
                      onPressed: () {},
                      child: Text(
                        "Next",
                        style: AppText.buttonText.copyWith(
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
