import 'package:flutter/material.dart';
import 'package:flutter_game_module/pages/congratulation/congratulation_page.dart';
import 'package:flutter_game_module/pages/timeTravel/time_travel_2_page.dart';
import 'package:flutter_game_module/routes/app_pages.dart';
import 'package:flutter_game_module/pages/timeTravel/time_travel_1_page.dart';

class CustomRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    return switch (settings.name) {
      AppPages.congratulations => MaterialPageRoute(
          builder: (_) => CongratulationsPage(
            points: settings.arguments as String,
          ),
        ),
      AppPages.timeTravel1 => MaterialPageRoute(
          builder: (_) => const TimeTravel1Page(),
        ),
      AppPages.timeTravel2 => MaterialPageRoute(
          builder: (_) => const TimeTravel2Page(),
        ),
      _ => MaterialPageRoute(
          builder: (_) => const TimeTravel1Page(),
        ),
    };
  }
}
