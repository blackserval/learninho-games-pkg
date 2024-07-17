
import 'package:flutter/material.dart';
import 'package:flutter_game_module/config/constants.dart';
import 'package:flutter_game_module/shared/widgets/drag_target_widget.dart';
import 'package:flutter_game_module/pages/magicWord/widgets/letters_widget.dart';

import '../../shared/theme/app_text.dart';
import '../../shared/widgets/custom_appbar.dart';

class MagicWordPage1 extends StatefulWidget {
  const MagicWordPage1({super.key});

  @override
  State<MagicWordPage1> createState() => _MagicWordPage1State();
}

class _MagicWordPage1State extends State<MagicWordPage1> {
  Map<String, String?> targets = {'0': null, '1': null, '2': null, '3': null};
  final resetNotifier = ValueNotifier(0);

  void resetGame() {
    // Aqui nao importa o dado, mas sim fazer uma alteração
    //Para os listener receberem
    resetNotifier.value++;
    setState(
      () => targets = targets.map((key, value) => MapEntry(key, null)),
    );
  }

  void onTargetAccept({
    required String target,
    required DragTargetDetails<Map<String, dynamic>> details,
  }) {
    // audio ?
    setState(() => targets[target] = details.data['value']);
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
              child: LettersWidget(
                letters: magicWordTest1.sublist(0, 4),
                targets: targets,
              ),
            ),
            Flexible(
              flex: 2,
              child: Column(
                children: [
                  Expanded(
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
                  const Text("Flutter", style: AppText.title),
                  const SizedBox(height: 16),
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
                        resetNotifier: resetNotifier,
                        onAcceptItem: (value) => onTargetAccept(
                          target: '0',
                          details: value,
                        ),
                      ),
                      DragTargetWidget(
                        targetValue: '1',
                        widgetType: WidgetType.rectangle,
                        resetNotifier: resetNotifier,
                        onAcceptItem: (value) => onTargetAccept(
                          target: '1',
                          details: value,
                        ),
                      ),
                      DragTargetWidget(
                        targetValue: '2',
                        widgetType: WidgetType.rectangle,
                        resetNotifier: resetNotifier,
                        onAcceptItem: (value) => onTargetAccept(
                          target: '2',
                          details: value,
                        ),
                      ),
                      DragTargetWidget(
                        targetValue: '3',
                        widgetType: WidgetType.rectangle,
                        resetNotifier: resetNotifier,
                        onAcceptItem: (value) => onTargetAccept(
                          target: '3',
                          details: value,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
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
            Flexible(
              flex: 1,
              child: LettersWidget(
                letters: magicWordTest1.sublist(4),
                targets: targets,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
