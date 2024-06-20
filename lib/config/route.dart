import 'package:flutter/material.dart';
import 'package:flutter_game_module/config/app_pages.dart';
import 'package:flutter_game_module/pages/home_page.dart';

class CustomRouter {
  static Route<dynamic> generateRoute(RouteSettings set) {
    return switch (set.name) {
      AppPages.home => MaterialPageRoute(
          builder: (_) => const HomePage(),
        ),
      _ => MaterialPageRoute(
          builder: (_) => const HomePage(),
        ),
    };
  }
}
