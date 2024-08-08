import 'package:flutter/material.dart';
import 'package:flutter_game_module/config/constants.dart';
import 'package:flutter_game_module/controllers/game_controller.dart';
import 'package:flutter_game_module/model/assets_model.dart';
import 'package:flutter_game_module/shared/widgets/drag_target_widget.dart';
import 'package:flutter_game_module/pages/magicWord/widgets/letters_widget.dart';
import 'package:flutter_game_module/shared/widgets/image_widget.dart';
import 'package:flutter_game_module/shared/widgets/next_button.dart';
import 'package:flutter_game_module/utils/responsive_widget.dart';
import 'package:get_it/get_it.dart';

import '../../routes/app_pages.dart';
import '../../shared/app_images.dart';
import '../../shared/custom_snack.dart';
import '../../shared/theme/app_text.dart';
import '../../shared/widgets/audio_button.dart';
import '../../shared/widgets/custom_appbar.dart';

class MagicWordPage1 extends StatefulWidget {
  const MagicWordPage1({super.key});

  @override
  State<MagicWordPage1> createState() => _MagicWordPage1State();
}

class _MagicWordPage1State extends State<MagicWordPage1> {
  Map<String, String?> targets = {'0': null, '1': null, '2': null, '3': null};
  final resetNotifier = ValueNotifier(0);
  final snack = GetIt.I.get<CustomSnack>();
  final controller = GetIt.I.get<GameController>();

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
      pageFrom: AppPages.magicWord1,
      level: 1,
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Flexible(
                            flex: 1,
                            child: LettersWidget(
                              letters: magicWordTest.sublist(0, 4),
                              targets: targets,
                            ),
                          ),
                          Flexible(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const ImageWidget(
                                  image:
                                      "https://www.creativefabrica.com/wp-content/uploads/2023/09/05/Nature-wallpaper-Graphics-78543985-1.jpg",
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  "Flutter",
                                  style: AppText.title.copyWith(
                                    fontSize: ResponsiveWidget.isMobile(context)
                                        ? 22
                                        : 32,
                                  ),
                                ),
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
                                NextButton(onTap: onSubmit),
                              ],
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: LettersWidget(
                              letters: magicWordTest.sublist(4),
                              targets: targets,
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
