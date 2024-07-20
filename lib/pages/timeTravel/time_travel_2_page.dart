import 'package:flutter/material.dart';
import 'package:flutter_game_module/config/constants.dart';
import 'package:flutter_game_module/model/assets_model.dart';
import 'package:flutter_game_module/model/game_model.dart';
import 'package:flutter_game_module/shared/app_images.dart';
import 'package:flutter_game_module/shared/widgets/audio_button.dart';
import 'package:flutter_game_module/shared/widgets/next_button.dart';
import 'package:get_it/get_it.dart';

import '../../controllers/game_controller.dart';
import '../../routes/app_pages.dart';
import '../../shared/custom_snack.dart';
import '../../shared/widgets/custom_appbar.dart';
import '../../shared/widgets/draggable_widget.dart';
import 'widget/time_travel_target_widget.dart';

class TimeTravel2Page extends StatefulWidget {
  final GameModel model;

  const TimeTravel2Page({super.key, required this.model});

  @override
  State<TimeTravel2Page> createState() => _TimeTravel2PageState();
}

class _TimeTravel2PageState extends State<TimeTravel2Page> {
  final controller = GetIt.I.get<GameController>();
  final snack = GetIt.I.get<CustomSnack>();

  final ValueNotifier resetNotifier = ValueNotifier(0);
  Map<String, String?> targets = {
    "0": null,
    "1": null,
    "2": null,
    "3": null,
    '4': null,
  };

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
    setState(() => targets[target] = details.data.value);
  }

  void onSubmit() {
    bool res = targets.values.contains(null);
    if (res) {
      snack.warning(text: 'Place all cards to continue');
      return;
    }
    controller.checkSocre(
      targets: targets,
      pageFrom: AppPages.timeTravel2,
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
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
              Container(
                padding: const EdgeInsets.all(22),
                width: size.width,
                height: size.height,
                child: LayoutBuilder(
                  builder: (context, constrains) {
                    return SingleChildScrollView(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: constrains.maxHeight,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TimeTravelTargetWidget(
                              resetNotifier: resetNotifier,
                              onTargetAccept: (target, detail) {
                                onTargetAccept(target: target, details: detail);
                              },
                              images: const [
                                AppImages.retanguloAzul,
                                AppImages.retanguloRoxo,
                                AppImages.retanguloVerde,
                                AppImages.retanguloLaranja,
                                AppImages.retanguloVermelho,
                              ],
                            ),
                            const SizedBox(height: 30),
                            // Widgets Draggable
                            SafeArea(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const SizedBox.shrink(),
                                  Flexible(
                                    child: Wrap(
                                      spacing: 8,
                                      runSpacing: 8,
                                      runAlignment: WrapAlignment.center,
                                      alignment: WrapAlignment.center,
                                      children: widget.model.assets!
                                          .map((e) => DraggableWidget(
                                                targets: targets,
                                                item: e,
                                                widgetType: WidgetType.circle,
                                              ))
                                          .toList(),
                                    ),
                                  ),
                                  NextButton(onTap: onSubmit),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: SafeArea(
                  child: CustomAppbar(refreh: resetGame),
                ),
              ),
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
    );
  }
}
