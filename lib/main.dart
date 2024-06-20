import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_game_module/config/locators.dart';
import 'package:flutter_game_module/utils/native_bridge.dart';
import 'app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  //Configure controller`s
  setupLocators();

  //Configure method channel for communications
  NativeBridge.instance.setupMethodChannel();

  //Lock screen to landscape
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]);

  runApp(const MyApp());
}
