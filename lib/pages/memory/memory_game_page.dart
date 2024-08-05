import 'package:flutter/material.dart';
import 'package:flutter_game_module/config/constants.dart';
import 'package:flutter_game_module/pages/memory/widgets/memory_card.dart';
import '../../model/card_model.dart';

class MemoryGamePage extends StatefulWidget {
  const MemoryGamePage({super.key});

  @override
  State<MemoryGamePage> createState() => _MemoryGamePageState();
}

class _MemoryGamePageState extends State<MemoryGamePage>
    with TickerProviderStateMixin {
  //
  List<AnimationController> animControllers = [];
  List<Animation<double>> animations = [];
  int? selectedCardIndex;
  List<CardModel> cards = [];
  bool canTouch = true;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => initGame());
    super.initState();
  }

  initGame() {
    setState(() {
      animControllers = [];
      animations = [];
      cards = [];
    });
    List<CardModel> tempCards = [];
    for (var e in memoryTest) {
      tempCards.add(
        CardModel(
          imageUrl: e.url ?? "",
          value: e.value.toString(),
          isFlipped: false,
          isMatched: false,
        ),
      );
      animControllers.add(AnimationController(
        duration: const Duration(milliseconds: 650),
        vsync: this,
      ));
    }

    animations = animControllers
        .map(
            (controller) => Tween<double>(begin: 0, end: 1).animate(controller))
        .toList();

    cards = tempCards;
    setState(() {});
  }

  @override
  void dispose() {
    for (var controller in animControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void flipCard({required int index}) {
    if (!cards[index].isFlipped && !cards[index].isMatched) {
      setState(() {
        cards[index].isFlipped = !cards[index].isFlipped;
      });
      animControllers[index].forward();
      checkMatch(index: index);
    }
  }

  void checkMatch({required int index}) async {
    if (selectedCardIndex == null || selectedCardIndex == index) {
      selectedCardIndex = index;
      return;
    }
    setState(() => canTouch = false);
    if (cards[selectedCardIndex!].value != cards[index].value) {
      await Future.delayed(const Duration(milliseconds: 1500));
      setState(() {
        cards[selectedCardIndex!].isFlipped = false;
        cards[index].isFlipped = false;
        canTouch = true;
      });
      animControllers[selectedCardIndex!].reverse();
      animControllers[index].reverse();
      selectedCardIndex = null;
      return;
    }
    setState(() {
      cards[selectedCardIndex!].isMatched = true;
      cards[index].isMatched = true;
      canTouch = true;
    });
    selectedCardIndex = null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Memory Game"),
        actions: [
          IconButton(
            onPressed: () {
              initGame();
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(22),
        child: cards.isEmpty
            ? const Center(
                child: Text("Lista vazia"),
              )
            : SafeArea(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                  ),
                  itemCount: cards.length,
                  itemBuilder: (context, index) {
                    return MemoryCard(
                      animation: animations[index],
                      animationController: animControllers[index],
                      model: cards[index],
                      index: index,
                      canTouch: canTouch,
                      onTap: ({required index}) {
                        flipCard(index: index);
                      },
                    );
                  },
                ),
              ),
      ),
    );
  }
}
