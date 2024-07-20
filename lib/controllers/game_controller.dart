import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_game_module/controllers/navigation_controller.dart';
import 'package:get_it/get_it.dart';

import '../model/arguments/congratulation_page_args.dart';
import '../routes/app_pages.dart';

class GameController {
  final audioplayer = AudioPlayer();
  NavigationController get route => GetIt.I.get<NavigationController>();

  void checkSocre({
    required Map<String, String?> targets,
    required String pageFrom,
  }) {
    int score = 0;

    for (var entry in targets.entries) {
      if (entry.key == entry.value) {
        score++;
      }
    }

    route.push(
      name: AppPages.congratulations,
      args: CongratulationPageArgs(
        tryAgain: score < 1,
        pageFrom: pageFrom,
        score: score,
      ),
    );
  }
}
