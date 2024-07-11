import 'package:flutter/material.dart';
import 'package:flutter_game_module/shared/theme/app_text.dart';
import 'package:get_it/get_it.dart';

import '../../../controllers/navigation_controller.dart';
import '../../../model/arguments/congratulation_page_args.dart';

class StarWidget extends StatelessWidget {
  final CongratulationPageArgs model;

  const StarWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final route = GetIt.I.get<NavigationController>();

    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      top: 0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            model.image,
            height: 200,
            fit: BoxFit.fitHeight,
          ),
          Text(
            model.label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          model.tryAgain
              ? ElevatedButton(
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
                )
              : ElevatedButton(
                  onPressed: () {
                    route.removeUntil(name: model.pageTo);
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
                ),
        ],
      ),
    );
  }
}
