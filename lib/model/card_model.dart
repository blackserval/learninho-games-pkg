import 'package:flutter/material.dart';
import 'package:flutter_game_module/model/assets_model.dart';

import '../controllers/memory_game_controller.dart';

class CardModel {
  final int value;
  final AssetsModel image;
  final Color color;
  CardState state;

  CardModel({
    required this.value,
    required this.image,
    required this.color,
    this.state = CardState.hidden,
  });
}
