import 'package:flutter_game_module/controllers/navigation_controller.dart';
import 'package:flutter_game_module/controllers/time_travel_controller.dart';
import 'package:flutter_game_module/shared/custom_snack.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

setupLocators() {
  locator.registerSingleton<NavigationController>(NavigationController());
  locator.registerSingleton<TimeTravelController>(TimeTravelController());
  locator.registerSingleton<CustomSnack>(CustomSnack());
}
