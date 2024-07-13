import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_game_module/config/constants.dart';
import 'package:flutter_game_module/pages/timeTravel/widget/drag_target_positioned_widget.dart';
import 'package:flutter_game_module/shared/app_images.dart';
import 'package:flutter_game_module/shared/theme/app_text.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_game_module/shared/widgets/custom_bottom_bar.dart';
import 'package:get_it/get_it.dart';

import '../../controllers/time_travel_controller.dart';
import '../../shared/app_sounds.dart';
import '../../shared/custom_snack.dart';
import '../../shared/widgets/custom_appbar.dart';
import '../../shared/widgets/draggable_widget.dart';

class TimeTravel2Page extends StatefulWidget {
  const TimeTravel2Page({super.key});

  @override
  State<TimeTravel2Page> createState() => _TimeTravel2PageState();
}

class _TimeTravel2PageState extends State<TimeTravel2Page> {
  final timeTravelController = GetIt.I.get<TimeTravelController>();
  final snack = GetIt.I.get<CustomSnack>();

  final confetti = ConfettiController(
    duration: const Duration(seconds: 5),
  );
  final ValueNotifier resetNotifier = ValueNotifier(0);
  final audioplayer = AudioPlayer();
  Map<String, String?> targets = {
    "0": null,
    "1": null,
    "2": null,
    "3": null,
    '4': null,
  };

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (ModalRoute.of(context)?.isCurrent ?? false) {
      audioplayer.play(AssetSource(AppSounds.timeTravel));
    }
  }

  @override
  void dispose() {
    confetti.dispose();
    audioplayer.dispose();
    super.dispose();
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
    required DragTargetDetails<Map<String, dynamic>> details,
  }) {
    setState(() => targets[target] = details.data['value']);
  }

  void onSubmit() {
    bool res = targets.values.contains(null);
    if (res) {
      snack.warning(text: 'Place all cards to continue');
      return;
    }
    // timeTravelController.checkGameScore(targets);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: CustomAppbar(refreh: resetGame),
      bottomNavigationBar: const CustomBottomBar(),
      body: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //Image
              Stack(
                children: [
                  // Image
                  SizedBox(
                    height: 350,
                    width: 350,
                    child: Image.asset(
                      AppImages.timeTravel2,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  // Widgets DragTarget
                  DragTargetPositionedWidget(
                    top: 12,
                    left: 140,
                    targetValue: '0',
                    resetNotifier: resetNotifier,
                    backgroundColor: Colors.green,
                    onAcceptItem: (value) => onTargetAccept(
                      target: '0',
                      details: value,
                    ),
                  ),
                  DragTargetPositionedWidget(
                    top: 92,
                    right: 30,
                    targetValue: '1',
                    resetNotifier: resetNotifier,
                    backgroundColor: Colors.red,
                    onAcceptItem: (value) => onTargetAccept(
                      target: '1',
                      details: value,
                    ),
                  ),
                  DragTargetPositionedWidget(
                    bottom: 15,
                    right: 75,
                    targetValue: '2',
                    resetNotifier: resetNotifier,
                    backgroundColor: Colors.blue,
                    onAcceptItem: (value) => onTargetAccept(
                      target: '2',
                      details: value,
                    ),
                  ),
                  DragTargetPositionedWidget(
                    bottom: 15,
                    left: 75,
                    targetValue: '3',
                    resetNotifier: resetNotifier,
                    backgroundColor: Colors.black,
                    onAcceptItem: (value) => onTargetAccept(
                      target: '3',
                      details: value,
                    ),
                  ),
                  DragTargetPositionedWidget(
                    top: 92,
                    left: 30,
                    targetValue: '4',
                    resetNotifier: resetNotifier,
                    backgroundColor: Colors.pink,
                    onAcceptItem: (value) => onTargetAccept(
                      target: '4',
                      details: value,
                    ),
                  ),
                ],
              ),
              // Widgets Draggable
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: size.width * 0.3,
                    height: size.height * 0.45,
                    child: Wrap(
                      spacing: 16,
                      runSpacing: 16,
                      runAlignment: WrapAlignment.center,
                      alignment: WrapAlignment.center,
                      children: timeTravel2Test
                          .map((e) => DraggableWidget(
                                targets: targets,
                                item: e,
                                widgetType: WidgetType.circle,
                              ))
                          .toList(),
                    ),
                  ),
                  const SizedBox(height: 22),
                  SizedBox(
                    width: 200,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        elevation: 4,
                      ),
                      onPressed: onSubmit,
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
            ],
          ),
          //Confetti animation
          Align(
            alignment: Alignment.center,
            child: ConfettiWidget(
              confettiController: confetti,
              blastDirectionality: BlastDirectionality.explosive,
              shouldLoop: false,
              emissionFrequency: 0.05,
              minBlastForce: 10,
              maxBlastForce: 50,
            ),
          ),
        ],
      ),
    );
  }
}
