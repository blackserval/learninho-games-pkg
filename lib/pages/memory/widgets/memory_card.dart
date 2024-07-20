import 'package:flutter/material.dart';
import 'package:flutter_game_module/model/card_model.dart';
import 'package:flutter_game_module/shared/theme/app_theme.dart';

import '../../../controllers/memory_game_controller.dart';

class MemoryCard extends StatelessWidget {
  final CardModel card;
  final int index;
  final Function(int) onCardPressed;

  const MemoryCard({
    required this.card,
    required this.index,
    required this.onCardPressed,
    super.key,
  });

  void onTap() {
    if (card.state == CardState.hidden) {
      onCardPressed(index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 80,
        height: 80,
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppTheme.appBorderRadius),
        ),
        child: card.state == CardState.hidden
            ? Container(
                width: 80,
                height: 80,
                color: card.color,
              )
            : Image.network(
                card.image.url!,
                fit: BoxFit.cover,
              ),
      ),
    );
  }
}
