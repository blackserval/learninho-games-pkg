import 'package:flutter/material.dart';
import 'package:flutter_game_module/config/constants.dart';
import 'package:flutter_game_module/controllers/time_travel_controller.dart';
import 'package:flutter_game_module/model/assets_model.dart';
import 'package:flutter_game_module/model/time_travel_model.dart';
import 'package:flutter_game_module/pages/timeTravel/widget/target_grid_widget.dart';
import 'package:flutter_game_module/routes/app_pages.dart';
import 'package:flutter_game_module/shared/app_images.dart';
import 'package:flutter_game_module/shared/custom_snack.dart';
import 'package:flutter_game_module/shared/widgets/audio_button.dart';
import 'package:flutter_game_module/shared/widgets/next_button.dart';
import 'package:flutter_game_module/utils/responsive_widget.dart';
import 'package:get_it/get_it.dart';

import '../../shared/widgets/custom_appbar.dart';
import '../../shared/widgets/draggable_widget.dart';

class TimeTravel1Page extends StatefulWidget {
  final TimeTravelModel model;

  const TimeTravel1Page({super.key, required this.model});

  @override
  State<TimeTravel1Page> createState() => _TimeTravel1PageState();
}

class _TimeTravel1PageState extends State<TimeTravel1Page> {
  final timeTravelController = GetIt.I.get<TimeTravelController>();
  final snack = GetIt.I.get<CustomSnack>();
  final resetNotifier = ValueNotifier(0);
  bool soundOn = true;

  Map<String, String?> targets = {'0': null, '1': null, '2': null, '3': null};

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
    setState(() => targets[target] = details.data.value);
  }

  void onSubmit() {
    bool res = targets.values.contains(null);
    if (res) {
      snack.warning(text: 'Place all cards to continue');
      return;
    }
    timeTravelController.checkScoreTimeTravel1(
      targets: targets,
      pageFrom: AppPages.timeTravel1,
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final appBarHeight = AppBar().preferredSize.height;
    final availableHeight = size.height - appBarHeight - 16;

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
                width: size.width,
                height: size.height,
                padding: const EdgeInsets.all(22),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return SingleChildScrollView(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: constraints.maxHeight,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  height: availableHeight,
                                  width: size.width / 2,
                                  child: TargetGridWidget(
                                    resetNotifier: resetNotifier,
                                    onTargetAccept: (target, detail) {
                                      onTargetAccept(
                                          target: target, details: detail);
                                    },
                                    images: const [
                                      AppImages.retanguloAzul,
                                      AppImages.retanguloRoxo,
                                      AppImages.retanguloVerde,
                                      AppImages.retanguloLaranja,
                                    ],
                                  ),
                                ),
                                Flexible(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      //Draggable
                                      Wrap(
                                        spacing: 8,
                                        runSpacing: 8,
                                        runAlignment: WrapAlignment.center,
                                        alignment: WrapAlignment.center,
                                        direction: Axis.horizontal,
                                        children: widget.model.assets!
                                            .map((e) => DraggableWidget(
                                                  targets: targets,
                                                  item: e,
                                                  widgetType: WidgetType.circle,
                                                  // color: Colors.red,
                                                ))
                                            .toList(),
                                      ),
                                      ResponsiveWidget.isMobile(context)
                                          ? const SizedBox(height: 22)
                                          : const SizedBox(height: 100),
                                      //Button
                                      NextButton(onTap: onSubmit),
                                    ],
                                  ),
                                ),
                              ],
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
