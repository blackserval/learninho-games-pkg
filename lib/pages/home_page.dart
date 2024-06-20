import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../config/constants.dart';
import '../shared/emoji_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final audioplayer = AudioPlayer();
  final Map<String, bool> score = {};
  //Random seed to shuffle order of items
  int seed = 0;

  @override
  void initState() {
    audioplayer.setSource(AssetSource('sounds/success.wav'));
    super.initState();
  }

  Widget buildTarget(String emoji) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: DragTarget<String>(
        onWillAcceptWithDetails: (details) => details.data == emoji,
        onAcceptWithDetails: (details) {
          setState(() => score[emoji] = true);

          audioplayer.resume();
        },
        onLeave: (data) {},
        builder: (context, List<String?> incoming, List rejected) {
          if (score[emoji] == true) {
            return Container(
              color: Colors.white,
              alignment: Alignment.center,
              height: 80,
              width: 200,
              child: const Text(
                "Correct!",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          } else {
            return Container(
              height: 80,
              width: 200,
              color: AppConstants.choices[emoji],
            );
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Score ${score.length} / 6"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          score.clear();
          seed++;
          setState(() {});
        },
        child: const Icon(Icons.refresh),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                SystemNavigator.pop(animated: true);
              },
              child: const Text("Voltar para o SwiftUi"),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: AppConstants.choices.keys.map((e) {
                    return Draggable<String>(
                      data: e,
                      feedback: EmojiWidget(emoji: e),
                      childWhenDragging: const EmojiWidget(emoji: '🌱'),
                      child: EmojiWidget(emoji: score[e] == true ? '✅' : e),
                    );
                  }).toList(),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: AppConstants.choices.keys
                      .map((e) => buildTarget(e))
                      .toList()
                    ..shuffle(Random(seed)),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
