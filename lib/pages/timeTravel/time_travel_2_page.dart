import 'package:flutter/material.dart';
import 'package:flutter_game_module/config/constants.dart';
import 'package:flutter_game_module/model/assets_model.dart';
import 'package:flutter_game_module/model/game_model.dart';
import 'package:flutter_game_module/shared/app_images.dart';
import 'package:flutter_game_module/shared/widgets/audio_button.dart';
import 'package:flutter_game_module/shared/widgets/next_button.dart';
import 'package:get_it/get_it.dart';

import '../../controllers/audio_controller.dart';
import '../../controllers/game_controller.dart';
import '../../routes/app_pages.dart';
import '../../shared/app_sounds.dart';
import '../../shared/custom_snack.dart';
import '../../shared/widgets/custom_appbar.dart';
import '../../shared/widgets/draggable_widget.dart';
import '../../utils/responsive_widget.dart';
import 'widget/time_travel_target_row.dart';

class TimeTravel2Page extends StatefulWidget {
  final GameModel model;

  const TimeTravel2Page({super.key, required this.model});

  @override
  State<TimeTravel2Page> createState() => _TimeTravel2PageState();
}

class _TimeTravel2PageState extends State<TimeTravel2Page> {
  final controller = GetIt.I.get<GameController>();
  final snack = GetIt.I.get<CustomSnack>();
  final audioController = GetIt.I.get<AudioController>();
  final ValueNotifier resetNotifier = ValueNotifier(0);
  Map<String, String?> targets = {
    "0": null,
    "1": null,
    "2": null,
    "3": null,
    '4': null,
  };

  @override
  void initState() {
    audioController.playSound(song: AppSounds.timeTravel);
    super.initState();
  }

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
      pageFrom: AppPages.timeTravel2,
      level: widget.model.level,
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    bool isMobile = ResponsiveWidget.isMobile(context);

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
          child: Stack(
            children: [
              SafeArea(
                child: Container(
                  width: size.width,
                  height: size.height,
                  padding: const EdgeInsets.all(22),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //Target
                      TimeTravelTargetRow(
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //Draggable
                          ...widget.model.assets!
                              .map(
                                (e) => Padding(
                                  padding: const EdgeInsets.only(right: 8),
                                  child: DraggableWidget(
                                    targets: targets,
                                    item: e,
                                    widgetType: WidgetType.circle,
                                  ),
                                ),
                              )
                              .toList()
                            ..shuffle(),
                          SizedBox(width: isMobile ? 35 : 50),
                          Flexible(
                            child: NextButton(onTap: onSubmit),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: CustomAppbar(refreh: resetGame),
              ),
              const Align(
                alignment: Alignment.bottomLeft,
                child: AudioButton(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
