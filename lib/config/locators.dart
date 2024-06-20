import 'package:flutter_game_module/controllers/navigation_controller.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

setupLocators() {
  locator.registerSingleton<NavigationController>(NavigationController());
}
