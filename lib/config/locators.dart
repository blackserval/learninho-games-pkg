import 'package:flutter_game_module/controllers/audio_controller.dart';
import 'package:flutter_game_module/controllers/memory_game_controller.dart';
import 'package:flutter_game_module/controllers/navigation_controller.dart';
import 'package:flutter_game_module/controllers/game_controller.dart';
import 'package:flutter_game_module/shared/custom_snack.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

setupLocators() {
  locator.registerSingleton<NavigationController>(NavigationController());
  locator.registerSingleton<CustomSnack>(CustomSnack());
  locator.registerSingleton<AudioController>(AudioController());
  //Games
  //
  locator.registerSingleton<GameController>(GameController());
  locator.registerSingleton<MemoryGameController>(MemoryGameController());
}
