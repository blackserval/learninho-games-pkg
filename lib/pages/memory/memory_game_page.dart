import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_game_module/controllers/memory_game_controller.dart';
import 'package:get_it/get_it.dart';

class MemoryGamePage extends StatefulWidget {
  const MemoryGamePage({super.key});

  @override
  State<MemoryGamePage> createState() => _MemoryGamePageState();
}

class _MemoryGamePageState extends State<MemoryGamePage> {
  final controller = GetIt.I.get<MemoryGameController>();
  final bool _flip = false;

  @override
  void initState() {
    controller.generateCards(4);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(22),
        child: SafeArea(
          child: SingleChildScrollView(
            clipBehavior: Clip.none,
            child: Column(
              children: [
                ValueListenableBuilder(
                  valueListenable: controller.canFlip,
                  builder: (context, flip, widget) {
                    return ValueListenableBuilder(
                      valueListenable: controller.cards,
                      builder: (context, cards, widget) {
                        if (cards == null) return SizedBox.fromSize();
                        return GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 6,
                            mainAxisSpacing: 16,
                            crossAxisSpacing: 16,
                          ),
                          itemCount: cards.length,
                          itemBuilder: (context, index) {
                            final item = cards[index];
                            return FlipCard(
                              onFlip: () {
                                print("Flip $item");
                                controller.onCardPressed(index);
                              },
                              flipOnTouch: flip,
                              direction: FlipDirection.VERTICAL,
                              side: CardSide.FRONT,
                              front: Container(
                                decoration: BoxDecoration(
                                  color: item.color,
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black45,
                                      blurRadius: 3,
                                      spreadRadius: 0.8,
                                      offset: Offset(2.0, 1),
                                    )
                                  ],
                                ),
                              ),
                              back: DecoratedBox(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  image: DecorationImage(
                                    image: NetworkImage(item.image.url!),
                                    fit: BoxFit.fitHeight,
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
