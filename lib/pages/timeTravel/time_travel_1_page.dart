import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_game_module/controllers/navigation_controller.dart';
import 'package:flutter_game_module/pages/timeTravel/widget/drag_target_widget.dart';
import 'package:flutter_game_module/routes/app_pages.dart';
import 'package:flutter_game_module/shared/app_images.dart';
import 'package:flutter_game_module/shared/theme/app_text.dart';
import 'package:get_it/get_it.dart';
import 'package:audioplayers/audioplayers.dart';

import 'widget/draggable_widget.dart';

class TimeTravel1Page extends StatefulWidget {
  const TimeTravel1Page({super.key});

  @override
  State<TimeTravel1Page> createState() => _TimeTravel1PageState();
}

class _TimeTravel1PageState extends State<TimeTravel1Page> {
  final route = GetIt.I.get<NavigationController>();
  final confetti = ConfettiController(
    duration: const Duration(seconds: 5),
  );
  final ValueNotifier resetNotifier = ValueNotifier(0);
  final audioplayer = AudioPlayer();
  bool soundOn = true;
  Map<String, bool> score = {"0": false, "1": false, "2": false, "3": false};
  final List<Map<String, String>> right = [
    {
      "url":
          "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e5/NASA_logo.svg/1224px-NASA_logo.svg.png",
      "value": "0"
    },
    {
      "url":
          "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e5/NASA_logo.svg/1224px-NASA_logo.svg.png",
      "value": "1"
    },
    {
      "url":
          "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e5/NASA_logo.svg/1224px-NASA_logo.svg.png",
      "value": "2"
    },
    {
      "url":
          "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e5/NASA_logo.svg/1224px-NASA_logo.svg.png",
      "value": "3"
    },
  ];

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
    //Troca todos os pontos para false
    setState(
      () => score = score.map((key, value) => MapEntry(key, false)),
    );
  }

  void onTargetAccept(DragTargetDetails<Map<String, dynamic>> details) {
    audioplayer.play(AssetSource('sounds/success.wav'));
    //Adiciono ao value do item true
    setState(() => score[details.data['value']] = true);
  }

  void goToNextGame() {
    route.push(name: AppPages.timeTravel2);

    // //Verifico se todos os values são true com o ".reduce"
    // bool success = score.values.toList().reduce((a, b) => a && b);
    // if (success) {
    //   confetti.play();
    //   audioplayer.play(AssetSource('sounds/success_end.wav'));
    //   //TODO: Retornar os dados para o nativo
    //   route.push(name: AppPages.timeTravel1);
    // }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Meus pontos ${score.values.where((e) => e).length} / ${score.length}",
        ),
        leading: Padding(
          padding: const EdgeInsets.only(top: 12),
          child: CircleAvatar(
            backgroundColor: Colors.grey[300],
            radius: 25,
            child: Icon(
              Icons.close,
              color: Colors.grey[800],
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: resetGame,
            icon: const Icon(Icons.refresh),
          )
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey[300],
              radius: 25,
              child: IconButton(
                onPressed: () {
                  setState(() => soundOn = !soundOn);
                },
                icon: soundOn
                    ? const Icon(Icons.volume_up_rounded)
                    : const Icon(Icons.volume_off_rounded),
                color: Colors.grey[800],
              ),
            ),
          ],
        ),
      ),
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
                      AppImages.timeTravel1,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  // Widgets DragTarget
                  DragTargetWidget(
                    top: 27,
                    left: 140,
                    targetValue: '0',
                    resetNotifier: resetNotifier,
                    backgroundColor: Colors.green,
                    onAcceptItem: onTargetAccept,
                  ),
                  DragTargetWidget(
                    top: 115,
                    right: 38,
                    targetValue: '1',
                    resetNotifier: resetNotifier,
                    backgroundColor: Colors.red,
                    onAcceptItem: onTargetAccept,
                  ),
                  DragTargetWidget(
                    bottom: 30,
                    right: 139,
                    targetValue: '2',
                    resetNotifier: resetNotifier,
                    backgroundColor: Colors.blue,
                    onAcceptItem: onTargetAccept,
                  ),
                  DragTargetWidget(
                    bottom: 118,
                    left: 38,
                    targetValue: '3',
                    resetNotifier: resetNotifier,
                    backgroundColor: Colors.black,
                    onAcceptItem: onTargetAccept,
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
                      children: right
                          .map((e) => DraggableWidget(score: score, item: e))
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
                      onPressed: goToNextGame,
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
              // blastDirection: pi / 2,
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
