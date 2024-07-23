import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_game_module/controllers/audio_controller.dart';
import 'package:get_it/get_it.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback refreh;

  const CustomAppbar({super.key, required this.refreh});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final audioController = GetIt.I.get<AudioController>();
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey[300],
            radius: 20,
            child: IconButton(
              icon: const Icon(Icons.close),
              color: Colors.grey[800],
              onPressed: () {
                audioController.stopSound();
                SystemNavigator.pop(animated: true);
              },
            ),
          ),
          CircleAvatar(
            backgroundColor: Colors.grey[300],
            radius: 20,
            child: IconButton(
              onPressed: refreh,
              icon: const Icon(Icons.refresh),
            ),
          ),
        ],
      ),
    );
  }
}
