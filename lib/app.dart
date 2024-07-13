import 'package:flutter/material.dart';
import 'package:flutter_game_module/routes/app_pages.dart';
import 'package:flutter_game_module/routes/route.dart';
import 'package:flutter_game_module/controllers/navigation_controller.dart';
import 'package:flutter_game_module/shared/custom_snack.dart';
import 'package:flutter_game_module/shared/theme/app_theme.dart';

import 'config/locators.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Learninho',
      theme: AppTheme.theme,
      scaffoldMessengerKey: locator.get<CustomSnack>().snackbarKey,
      //Route config
      initialRoute: AppPages.magicWord1,
      onGenerateRoute: CustomRouter.generateRoute,
      navigatorKey: locator.get<NavigationController>().navigatorKey,
      //End route config
    );
  }
}
