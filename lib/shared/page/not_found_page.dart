import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_game_module/shared/theme/app_text.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: BackButton(
          onPressed: () {
            SystemNavigator.pop();
          },
        ),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline_outlined,
              size: 50,
              color: Colors.grey,
            ),
            SizedBox(height: 22),
            Text("Jogo não encontrado", style: AppText.title),
          ],
        ),
      ),
    );
  }
}
