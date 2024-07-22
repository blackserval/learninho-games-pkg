import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_game_module/controllers/game_controller.dart';
import 'package:flutter_game_module/shared/theme/app_text.dart';
import 'package:get_it/get_it.dart';

import '../../../controllers/navigation_controller.dart';
import '../../../model/arguments/congratulation_page_args.dart';
import '../../../shared/app_images.dart';

class StarWidget extends StatelessWidget {
  final CongratulationPageArgs model;

  const StarWidget({super.key, required this.model});

  Widget _button() {
    final route = GetIt.I.get<NavigationController>();
    final gameController = GetIt.I.get<GameController>();

    if (model.tryAgain) {
      return ElevatedButton(
        onPressed: () {
          route.removeUntil(name: model.pageFrom);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8.0,
            horizontal: 12,
          ),
          child: Text(
            "Try again",
            style: AppText.buttonText.copyWith(
              color: Colors.amber,
            ),
          ),
        ),
      );
    }

    return ElevatedButton(
      onPressed: () {
        gameController.sendGameResult(value: model.score!);
        SystemNavigator.pop();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 12,
        ),
        child: Text(
          "Next",
          style: AppText.buttonText.copyWith(
            color: Colors.amber,
          ),
        ),
      ),
    );
  }

  String getTitle() {
    return switch (model.score) {
      0 => "You're doing well, let's try again?",
      1 || 2 => "Very good, shall we continue training?",
      3 || 4 || 5 => "Incredible, shall we learn more?",
      _ => "",
    };
  }

  String getImage() {
    return switch (model.score) {
      0 => AppImages.sad,
      1 => AppImages.star1,
      2 => AppImages.star2,
      3 || 4 => AppImages.star3,
      _ => AppImages.star3,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      top: 0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            getImage(),
            height: 200,
            fit: BoxFit.fitHeight,
          ),
          Text(
            getTitle(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          _button(),
        ],
      ),
    );
  }
}
