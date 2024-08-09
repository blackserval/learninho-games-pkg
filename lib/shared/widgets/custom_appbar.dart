import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_game_module/controllers/audio_controller.dart';
import 'package:flutter_game_module/controllers/navigation_controller.dart';
import 'package:flutter_game_module/routes/app_pages.dart';
import 'package:get_it/get_it.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback refreh;

  const CustomAppbar({super.key, required this.refreh});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final audioController = GetIt.I.get<AudioController>();
    final route = GetIt.I.get<NavigationController>();

    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.only(top: 8),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey[300],
              radius: 25,
              child: IconButton(
                icon: const Icon(Icons.close),
                color: Colors.grey[800],
                iconSize: 28,
                onPressed: () {
                  audioController.stopSound();

                  //Navega para a splash, pois a ultima tela sempre ficará salva
                  //A partir do swift o user estava vendo o ultimo jogo
                  route.removeUntil(name: AppPages.splash);

                  //Sai do modulo
                  SystemNavigator.pop(animated: true);
                },
              ),
            ),
            CircleAvatar(
              backgroundColor: Colors.grey[300],
              radius: 25,
              child: IconButton(
                onPressed: refreh,
                iconSize: 28,
                icon: const Icon(Icons.refresh),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
