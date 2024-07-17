import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_game_module/config/locators.dart';
import 'package:flutter_game_module/utils/native_bridge.dart';
import 'app.dart';
import 'shared/page/custom_error_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //Configure controller`s
  setupLocators();

  //Configure method channel for communications
  NativeBridge.instance.setupMethodChannel();

  //Lock screen to landscape
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]);

  //Customize error screen
  ErrorWidget.builder = (details) => CustomErrorPage.initialize(details);

  runApp(const MyApp());
}
