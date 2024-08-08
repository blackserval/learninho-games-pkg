import 'package:flutter/material.dart';
import '../../../model/arguments/congratulation_page_args.dart';

class TitleWidget extends StatelessWidget {
  final CongratulationPageArgs model;

  const TitleWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    String title = switch (model.score) {
      0 => "You're doing well, let's try again?",
      1 || 2 => "Very good, shall we continue training?",
      3 || 4 || 5 => "Incredible, shall we learn more?",
      _ => "",
    };

    return Text(
      title,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
