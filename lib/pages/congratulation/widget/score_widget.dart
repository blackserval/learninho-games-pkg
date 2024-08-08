import 'package:flutter/material.dart';
import 'package:flutter_game_module/shared/theme/app_theme.dart';

import '../../../model/arguments/congratulation_page_args.dart';

class ScoreWidget extends StatelessWidget {
  final CongratulationPageArgs model;

  const ScoreWidget({super.key, required this.model});

  double calculateScore() {
    debugPrint("Score: ${model.score}");
    debugPrint("Level: ${model.level}");
    if (model.level! >= 0 && model.level! <= 10) {
      return model.score!.toDouble() * 1;
    } else if (model.level! >= 11 && model.level! <= 20) {
      return model.score!.toDouble() * 1.2;
    } else if (model.level! >= 21 && model.level! <= 30) {
      return model.score!.toDouble() * 1.3;
    } else {
      return model.score!.toDouble();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          AppTheme.appBorderRadius,
        ),
        boxShadow: const [
          BoxShadow(
            spreadRadius: 2,
            blurRadius: 2,
            offset: Offset(2, 2),
            color: Colors.grey,
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "+ ${calculateScore()}",
            style: const TextStyle(
              color: Colors.orange,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 5),
          const Icon(
            Icons.star_rate_rounded,
            color: Colors.orange,
            size: 35,
          ),
        ],
      ),
    );
  }
}
