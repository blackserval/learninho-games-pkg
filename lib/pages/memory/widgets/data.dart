import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';

List<String> fillSourceArray() {
  return [
    'assets/animalspics/dino.png',
    'assets/animalspics/dino.png',
    'assets/animalspics/wolf.png',
    'assets/animalspics/wolf.png',
    'assets/animalspics/peacock.png',
    'assets/animalspics/peacock.png',
    'assets/animalspics/whale.png',
    'assets/animalspics/whale.png',
    'assets/animalspics/octo.png',
    'assets/animalspics/octo.png',
    'assets/animalspics/fish.png',
    'assets/animalspics/fish.png',
    'assets/animalspics/frog.png',
    'assets/animalspics/frog.png',
    'assets/animalspics/seahorse.png',
    'assets/animalspics/seahorse.png',
    'assets/animalspics/girraf.png',
    'assets/animalspics/girraf.png',
  ];
}

List<String> getSourceArray() {
  List<String> levelAndKindList = [];
  List sourceArray = fillSourceArray();

  for (var element in sourceArray) {
    levelAndKindList.add(element);
  }

  levelAndKindList.shuffle();
  return levelAndKindList;
}

List<bool> getInitialItemState() {
  List<bool> initialItemState = [];

  for (int i = 0; i < 18; i++) {
    initialItemState.add(true);
  }

  return initialItemState;
}

List<GlobalKey<FlipCardState>> getCardStateKeys() {
  List<GlobalKey<FlipCardState>> cardStateKeys = [];

  for (int i = 0; i < 18; i++) {
    cardStateKeys.add(GlobalKey<FlipCardState>());
  }

  return cardStateKeys;
}
