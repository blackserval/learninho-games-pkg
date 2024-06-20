import 'package:flutter/material.dart';
import 'package:flutter_game_module/config/app_pages.dart';
import 'package:flutter_game_module/config/route.dart';
import 'package:flutter_game_module/controllers/navigation_controller.dart';

import 'config/locators.dart';
import 'pages/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Learninho',
      home: const HomePage(),
      //Route config
      initialRoute: AppPages.home,
      onGenerateRoute: CustomRouter.generateRoute,
      navigatorKey: locator.get<NavigationController>().navigatorKey,
    );
  }
}
