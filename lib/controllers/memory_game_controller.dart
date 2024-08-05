// import 'dart:math';

// import 'package:flip_card/flip_card.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_game_module/config/constants.dart';
// import 'package:flutter_game_module/model/assets_model.dart';

// import '../model/card_model.dart';

// enum CardState { hidden, visible, guessed }

// class MemoryGameController {
//   //Flipou 2 trava
//   var canFlip = ValueNotifier<bool>(true);
//   var cards = ValueNotifier<List<CardModel>?>([]);
//   final random = Random();
//   int? gridSize;

//   void generateCards(int gridSize) async {
//     debugPrint("--GenerateCards $gridSize--");
//     cards.value = [];
//     final List<Color> colors = Colors.primaries.toList();
//     List<CardModel> newCardsList = [];
//     final images = generateImagesList(gridSize);

//     if (images.isEmpty) return;
//     debugPrint("Images ${images.length}");
//     //Percorre a grid
//     for (int i = 0; i < (gridSize * gridSize / 2); i++) {
//       final cardValue = i + 1;
//       final AssetsModel image = images.elementAt(i);
//       final Color cardColor = colors[random.nextInt(colors.length)];
//       final newCard = _createCardItems(
//         image: image,
//         color: cardColor,
//         value: cardValue,
//       );
//       newCardsList.addAll(newCard);
//     }

//     cards.value = newCardsList;
//     cards.value?.shuffle(Random());
//   }

//   List<AssetsModel> generateImagesList(int gridSize) {
//     debugPrint("--GenerateImageList--");
//     List<AssetsModel> images = [];
//     for (int i = 0; i < (gridSize * gridSize / 2); i++) {
//       final AssetsModel res = _getRandomImage();
//       images.add(res);
//       images.add(res);
//     }
//     return images;
//   }

//   AssetsModel _getRandomImage() {
//     int index = random.nextInt(memoryTest.length);
//     return memoryTest[index];
//   }

//   List<CardModel> _createCardItems({
//     required AssetsModel image,
//     required Color color,
//     required int value,
//   }) {
//     return List.generate(
//       2,
//       (index) => CardModel(
//         id: random.nextInt(10000).toString(),
//         cardKey: GlobalKey<FlipCardState>(),
//         value: value,
//         image: image,
//         color: color,
//       ),
//     );
//   }

//   void resetGame({required int gridSize}) {
//     generateCards(gridSize);
//   }

//   void onCardPressed(int index) {
//     cards.value![index].state = CardState.visible;

//     List<CardModel>? tempCardList = cards.value;
//     final List<CardModel> visibleCard = _getVisibleCardIndexes(tempCardList!);

//     if (visibleCard.length == 2) {
//       canFlip.value = false;

//       final CardModel card1 = visibleCard[0];
//       final CardModel card2 = visibleCard[1];

//       if (card1.value == card2.value) {
//         debugPrint("É igual");
//         for (var e in tempCardList) {
//           if (e.id == card1.id) e.state = CardState.guessed;
//           if (e.id == card2.id) e.state = CardState.guessed;
//         }
//         _isGameOver();
//       } else {
//         debugPrint("Nao É igual");
//         for (var e in tempCardList) {
//           if (e.id == card1.id) e.state = CardState.hidden;
//           if (e.id == card2.id) e.state = CardState.hidden;
//         }
//       }
//       canFlip.value = true;
//       cards.value = tempCardList;
//     }
//   }

//   List<CardModel> _getVisibleCardIndexes(List<CardModel> list) {
//     return list.where((entry) => entry.state == CardState.visible).toList();
//   }

//   void _isGameOver() {
//     bool res = cards.value!.every((e) => e.state == CardState.guessed);
//     debugPrint("Fim do jogo? $res");
//   }
// }
