import 'package:flutter/material.dart';
import 'package:flutter_game_module/config/constants.dart';
import 'package:flutter_game_module/model/assets_model.dart';
import 'package:flutter_game_module/shared/widgets/custom_appbar.dart';
import 'package:flutter_game_module/shared/widgets/drag_target_widget.dart';
import 'package:flutter_game_module/pages/magicWord/widgets/letters_widget.dart';
import 'package:flutter_game_module/shared/widgets/next_button.dart';
import 'package:get_it/get_it.dart';

import '../../controllers/game_controller.dart';
import '../../routes/app_pages.dart';
import '../../shared/app_images.dart';
import '../../shared/custom_snack.dart';
import '../../shared/widgets/audio_button.dart';
import '../../shared/widgets/image_widget.dart';

class MagicWordPage2 extends StatefulWidget {
  const MagicWordPage2({super.key});

  @override
  State<MagicWordPage2> createState() => _MagicWordPage2State();
}

class _MagicWordPage2State extends State<MagicWordPage2> {
  Map<String, String?> targets = {'0': null, '1': null, '2': null, '3': null};
  final resetNotifier = ValueNotifier(0);
  final snack = GetIt.I.get<CustomSnack>();
  final controller = GetIt.I.get<GameController>();

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
    setState(() => targets[target] = details.data.value.toString());
  }

  void onSubmit() {
    bool res = targets.values.contains(null);
    if (res) {
      snack.warning(text: 'Place all cards to continue');
      return;
    }
    controller.checkSocre(
      targets: targets,
      pageFrom: AppPages.magicWord2,
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppImages.timeTravel1Background),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            child: Stack(
              children: [
                //Body
                Container(
                  width: size.width,
                  height: size.height,
                  padding: const EdgeInsets.all(22),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Flexible(
                            flex: 1,
                            child: ImageWidget(
                              size: 120,
                              image:
                                  "https://www.creativefabrica.com/wp-content/uploads/2023/09/05/Nature-wallpaper-Graphics-78543985-1.jpg",
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                LettersWidget(
                                  letters: magicWordTest,
                                  targets: targets,
                                ),
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
                                NextButton(onTap: onSubmit),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                //Appbar
                Align(
                  alignment: Alignment.topLeft,
                  child: SafeArea(
                    child: CustomAppbar(refreh: resetGame),
                  ),
                ),
                //Sound button
                const Align(
                  alignment: Alignment.bottomLeft,
                  child: SafeArea(
                    child: AudioButton(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
