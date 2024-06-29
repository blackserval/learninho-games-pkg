import 'package:flutter/material.dart';
import 'package:flutter_game_module/routes/app_pages.dart';
import 'package:flutter_game_module/routes/route.dart';
import 'package:flutter_game_module/controllers/navigation_controller.dart';
import 'package:flutter_game_module/pages/time_travel_1_page.dart';
import 'package:flutter_game_module/shared/app_theme.dart';

import 'config/locators.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Learninho',
      home: const TimeTravel1Page(),
      theme: AppTheme.theme,
      //Route config
      initialRoute: AppPages.timeTravel1,
      onGenerateRoute: CustomRouter.generateRoute,
      navigatorKey: locator.get<NavigationController>().navigatorKey,
    );
  }
}
