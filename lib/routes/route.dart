import 'package:flutter/material.dart';
import 'package:flutter_game_module/config/constants.dart';
import 'package:flutter_game_module/model/arguments/congratulation_page_args.dart';
import 'package:flutter_game_module/pages/congratulation/congratulation_page.dart';
import 'package:flutter_game_module/pages/magicWord/magic_word_page1.dart';
import 'package:flutter_game_module/pages/magicWord/magic_word_page2.dart';
import 'package:flutter_game_module/pages/splash/splash_page.dart';
import 'package:flutter_game_module/routes/app_pages.dart';
import 'package:flutter_game_module/pages/timeTravel/time_travel_1_page.dart';
import 'package:flutter_game_module/shared/page/not_found_page.dart';

import '../model/time_travel_model.dart';
import '../pages/timeTravel/time_travel_2_page.dart';

class CustomRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    return switch (settings.name) {
      AppPages.splash => MaterialPageRoute(builder: (_) => const SplashPage()),
      //
      AppPages.timeTravel1 => MaterialPageRoute(
          builder: (_) => TimeTravel1Page(
            model: settings.arguments as TimeTravelModel,
          ),
        ),
      //
      AppPages.timeTravel2 => MaterialPageRoute(
          builder: (_) => TimeTravel2Page(
            model: settings.arguments as TimeTravelModel,
          ),
        ),
      //
      AppPages.magicWord1 =>
        MaterialPageRoute(builder: (_) => const MagicWordPage1()),
      //
      AppPages.magicWord2 =>
        MaterialPageRoute(builder: (_) => const MagicWordPage2()),
      //
      AppPages.congratulations => MaterialPageRoute(
          builder: (_) => CongratulationsPage(
            model: settings.arguments as CongratulationPageArgs,
          ),
        ),
      //Default
      _ => MaterialPageRoute(builder: (_) => const NotFoundPage()),
    };
  }
}
