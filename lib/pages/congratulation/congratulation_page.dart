import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_game_module/shared/app_images.dart';

class CongratulationsPage extends StatelessWidget {
  final String points;

  const CongratulationsPage({super.key, required this.points});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset(
              AppImages.blocks,
              height: 200,
              fit: BoxFit.fitHeight,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset(
              AppImages.world,
              height: 200,
              fit: BoxFit.fitHeight,
            ),
          ),
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
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Transform.rotate(
                      angle: -10 * pi / 180,
                      child: Image.asset(
                        AppImages.star,
                        height: 140,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    Image.asset(
                      AppImages.star,
                      height: 180,
                      fit: BoxFit.fitHeight,
                    ),
                    Transform.rotate(
                      angle: 10 * pi / 180,
                      child: Image.asset(
                        AppImages.star,
                        height: 140,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ],
                ),
                const Text(
                  "Well done!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 130,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "+ $points",
                          style: const TextStyle(
                            color: Colors.orange,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Icon(
                          Icons.star,
                          color: Colors.orange,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
