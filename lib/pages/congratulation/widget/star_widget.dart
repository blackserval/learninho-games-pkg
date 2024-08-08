import 'package:flutter/material.dart';
import '../../../model/arguments/congratulation_page_args.dart';
import '../../../shared/app_images.dart';

class StarWidget extends StatelessWidget {
  final CongratulationPageArgs model;

  const StarWidget({super.key, required this.model});

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
    return Image.asset(
      getImage(),
      height: 200,
      fit: BoxFit.fitHeight,
    );
  }
}
