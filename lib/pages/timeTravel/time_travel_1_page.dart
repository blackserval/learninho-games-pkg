import 'package:flutter/material.dart';
import 'package:flutter_game_module/config/constants.dart';
import 'package:flutter_game_module/controllers/time_travel_controller.dart';
import 'package:flutter_game_module/pages/timeTravel/widget/target_grid_widget.dart';
import 'package:flutter_game_module/shared/custom_snack.dart';
import 'package:flutter_game_module/shared/theme/app_text.dart';
import 'package:get_it/get_it.dart';

import '../../shared/widgets/custom_appbar.dart';
import '../../shared/widgets/draggable_widget.dart';

class TimeTravel1Page extends StatefulWidget {
  const TimeTravel1Page({super.key});

  @override
  State<TimeTravel1Page> createState() => _TimeTravel1PageState();
}

class _TimeTravel1PageState extends State<TimeTravel1Page> {
  final timeTravelController = GetIt.I.get<TimeTravelController>();
  final snack = GetIt.I.get<CustomSnack>();
  final resetNotifier = ValueNotifier(0);

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
    required DragTargetDetails<Map<String, dynamic>> details,
  }) {
    // audio ?
    setState(() => targets[target] = details.data['value']);
  }

  void onSubmit() {
    bool res = targets.values.contains(null);
    if (res) {
      snack.warning(text: 'Place all cards to continue');
      return;
    }
    timeTravelController.checkGameScore(targets);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: CustomAppbar(refreh: resetGame),
      // bottomNavigationBar: const CustomBottomBar(),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          //Image
          // Target1Widget(
          //   resetNotifier: resetNotifier,
          //   onTargetAccept: (target, detail) {
          //     onTargetAccept(target: target, details: detail);
          //   },
          // ),
          TargetGridWidget(
            resetNotifier: resetNotifier,
            onTargetAccept: (target, detail) {
              onTargetAccept(target: target, details: detail);
            },
          ),
          // Widgets Draggable
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Draggable
              SizedBox(
                width: size.width * 0.3,
                height: size.height * 0.45,
                child: Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  runAlignment: WrapAlignment.center,
                  alignment: WrapAlignment.center,
                  children: timeTravel1Test
                      .map((e) => DraggableWidget(
                            targets: targets,
                            item: e,
                            widgetType: WidgetType.circle,
                            color: Colors.red,
                          ))
                      .toList(),
                ),
              ),
              const SizedBox(height: 22),
              //Button
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
    );
  }
}


// Align(
//   alignment: Alignment.center,
//   child: ConfettiWidget(
//     confettiController: confetti,
//     blastDirectionality: BlastDirectionality.explosive,
//     shouldLoop: false,
//     emissionFrequency: 0.05,
//     minBlastForce: 10,
//     maxBlastForce: 50,
//   ),
// ),