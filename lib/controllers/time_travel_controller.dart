import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_game_module/controllers/navigation_controller.dart';
import 'package:flutter_game_module/shared/app_images.dart';
import 'package:flutter_game_module/shared/app_sounds.dart';
import 'package:get_it/get_it.dart';

import '../model/arguments/congratulation_page_args.dart';
import '../routes/app_pages.dart';

class TimeTravelController {
  final audioplayer = AudioPlayer();
  NavigationController get route => GetIt.I.get<NavigationController>();

  void checkGameScore(Map<String, String?> targets) {
    int score = 0;

    for (var entry in targets.entries) {
      if (entry.key == entry.value) {
        score++;
      }
    }

    switch (score) {
      case 0:
        audioplayer.play(AssetSource(AppSounds.star0));
        route.push(
          name: AppPages.congratulations,
          args: CongratulationPageArgs(
            image: AppImages.sad,
            label: "You're doing well, let's try again?",
            tryAgain: true,
            pageFrom: AppPages.timeTravel1,
            pageTo: AppPages.timeTravel2,
          ),
        );
        break;
      case 1:
        audioplayer.play(AssetSource(AppSounds.star1));
        route.push(
          name: AppPages.congratulations,
          args: CongratulationPageArgs(
            image: AppImages.star1,
            label: "Very good, shall we continue training?",
            tryAgain: false,
            pageFrom: AppPages.timeTravel1,
            pageTo: AppPages.timeTravel2,
          ),
        );
        break;
      case 2:
        audioplayer.play(AssetSource(AppSounds.star1));
        route.push(
          name: AppPages.congratulations,
          args: CongratulationPageArgs(
            image: AppImages.star1,
            label: "Very good, shall we continue training?",
            tryAgain: false,
            pageFrom: AppPages.timeTravel1,
            pageTo: AppPages.timeTravel2,
          ),
        );
        break;
      case 3:
        audioplayer.play(AssetSource(AppSounds.star2));
        route.push(
          name: AppPages.congratulations,
          args: CongratulationPageArgs(
            image: AppImages.star2,
            label: "Incredible, shall we learn more?",
            tryAgain: false,
            pageFrom: AppPages.timeTravel1,
            pageTo: AppPages.timeTravel2,
          ),
        );
        break;
      case 4:
        audioplayer.play(AssetSource(AppSounds.star3));
        route.push(
          name: AppPages.congratulations,
          args: CongratulationPageArgs(
            image: AppImages.star3,
            label: "Incredible, shall we learn more?",
            tryAgain: false,
            pageFrom: AppPages.timeTravel1,
            pageTo: AppPages.timeTravel2,
          ),
        );
        break;
      default:
    }
  }
}
