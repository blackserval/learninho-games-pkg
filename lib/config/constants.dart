import 'package:flutter/material.dart';

class AppConstants {
  static String channelName =
      "com.example.flutter_game_module.host/nativeCommunication";

  static const String methodReceiveData = "receiveDataFromNative";
  static const String methodOpenGameA = "openGameA";

  static final choices = {
    '🍎': Colors.red,
    '🍇': Colors.purple,
    '🥕': Colors.orange,
    '🥥': Colors.brown,
    '🍋': Colors.green,
  };
}
