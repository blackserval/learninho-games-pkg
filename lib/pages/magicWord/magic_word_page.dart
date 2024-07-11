import 'package:flutter/material.dart';
import 'package:flutter_game_module/shared/widgets/drag_target_widget.dart';
import 'package:flutter_game_module/pages/magicWord/widgets/letters_widget.dart';

import '../../shared/theme/app_text.dart';

class MagicWordPage extends StatefulWidget {
  const MagicWordPage({super.key});

  @override
  State<MagicWordPage> createState() => _MagicWordPageState();
}

class _MagicWordPageState extends State<MagicWordPage> {
  Map<String, String?> targets = {'0': null, '1': null, '2': null, '3': null};
  final resetNotifier = ValueNotifier(0);
  final List<Map<String, String>> letters = [
    {
      "url":
          "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e5/NASA_logo.svg/1224px-NASA_logo.svg.png",
      "value": "0"
    },
    {
      "url":
          "https://t3.ftcdn.net/jpg/05/73/55/12/360_F_573551225_h5mGL6pOLL5mDJi9pz7nYfG8uCppOfvW.jpg",
      "value": "1"
    },
    {
      "url":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQV6-DQF2pBwNFV9KzPafu9RghrNF1tZ8J3AA&s",
      "value": "2"
    },
    {
      "url":
          "https://img.freepik.com/fotos-gratis/papel-de-parede-de-lua-de-arte-digital_23-2150918875.jpg",
      "value": "3"
    },
    {
      "url":
          "https://c4.wallpaperflare.com/wallpaper/974/565/254/windows-11-windows-10-minimalism-hd-wallpaper-thumb.jpg",
      "value": "4"
    },
    {
      "url":
          "https://static.vecteezy.com/system/resources/thumbnails/025/067/762/small_2x/4k-beautiful-colorful-abstract-wallpaper-photo.jpg",
      "value": "5"
    },
    {
      "url":
          "https://blogdoiphone.com/wp-content/uploads/2023/06/Wallpaper-iOS-17-hero.jpg",
      "value": "6"
    },
    {
      "url":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSFP93SPaCispi2E2vNcBJm3IX3f7JgS8TP-g&s",
      "value": "7"
    },
  ];

  void resetGame() {
    // Aqui nao importa o dado, mas sim fazer uma alteração
    //Para os listener receberem
    resetNotifier.value++;
    setState(
      () => targets = targets.map((key, value) => MapEntry(key, null)),
    );
  }

  void onTargetAccept({
    required String target,
    required DragTargetDetails<Map<String, dynamic>> details,
  }) {
    // audio ?
    setState(() => targets[target] = details.data['value']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: const EdgeInsets.only(top: 12),
          child: CircleAvatar(
            backgroundColor: Colors.grey[300],
            radius: 25,
            child: Icon(
              Icons.close,
              color: Colors.grey[800],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: LettersWidget(
                letters: letters.sublist(0, 4),
                targets: targets,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const FlutterLogo(size: 150),
                const SizedBox(height: 30),
                const Text("Flutter"),
                const SizedBox(height: 30),
                //Targets
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  runAlignment: WrapAlignment.center,
                  alignment: WrapAlignment.center,
                  children: [
                    DragTargetWidget(
                      targetValue: '0',
                      onAcceptItem: (value) => onTargetAccept(
                        target: '0',
                        details: value,
                      ),
                      backgroundColor: Colors.red,
                      resetNotifier: resetNotifier,
                    ),
                    DragTargetWidget(
                      targetValue: '1',
                      onAcceptItem: (value) => onTargetAccept(
                        target: '1',
                        details: value,
                      ),
                      backgroundColor: Colors.pink,
                      resetNotifier: resetNotifier,
                    ),
                    DragTargetWidget(
                      targetValue: '2',
                      onAcceptItem: (value) => onTargetAccept(
                        target: '2',
                        details: value,
                      ),
                      backgroundColor: Colors.blue,
                      resetNotifier: resetNotifier,
                    ),
                    DragTargetWidget(
                      targetValue: '3',
                      onAcceptItem: (value) => onTargetAccept(
                        target: '3',
                        details: value,
                      ),
                      backgroundColor: Colors.green,
                      resetNotifier: resetNotifier,
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: 200,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      elevation: 4,
                    ),
                    onPressed: () {},
                    child: Text(
                      "Next",
                      style: AppText.buttonText.copyWith(
                        letterSpacing: 2,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Flexible(
              child: LettersWidget(
                letters: letters.sublist(4),
                targets: targets,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
