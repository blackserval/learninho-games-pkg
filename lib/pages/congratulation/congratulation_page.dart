import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_game_module/model/arguments/congratulation_page_args.dart';
import 'package:flutter_game_module/pages/congratulation/widget/star_widget.dart';
import 'package:flutter_game_module/shared/app_images.dart';

class CongratulationsPage extends StatelessWidget {
  final CongratulationPageArgs model;

  const CongratulationsPage({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Stack(
        children: [
          //Blocks
          Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset(
              AppImages.blocks,
              height: 200,
              fit: BoxFit.fitHeight,
            ),
          ),
          //World
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset(
              AppImages.world,
              height: 200,
              fit: BoxFit.fitHeight,
            ),
          ),
          //Blocks
          Positioned(
            top: -5,
            left: 0,
            right: 0,
            child: Transform.rotate(
              angle: 270 * pi / 180,
              child: Image.asset(
                AppImages.world,
                height: 130,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          StarWidget(model: model),
        ],
      ),
    );
  }
}
