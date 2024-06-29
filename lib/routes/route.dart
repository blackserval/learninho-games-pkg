import 'package:flutter/material.dart';
import 'package:flutter_game_module/routes/app_pages.dart';
import 'package:flutter_game_module/pages/time_travel_1_page.dart';

class CustomRouter {
  static Route<dynamic> generateRoute(RouteSettings set) {
    return switch (set.name) {
      AppPages.timeTravel1 => MaterialPageRoute(
          builder: (_) => const TimeTravel1Page(),
        ),
      _ => MaterialPageRoute(
          builder: (_) => const TimeTravel1Page(),
        ),
    };
  }
}
