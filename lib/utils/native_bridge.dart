import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart';
import 'package:flutter_game_module/config/constants.dart';
import 'package:flutter_game_module/controllers/navigation_controller.dart';
import 'package:flutter_game_module/model/game_model.dart';
import 'package:flutter_game_module/repository/preferences/audio_preferences.dart';
import 'package:flutter_game_module/shared/custom_snack.dart';
import 'package:get_it/get_it.dart';

import '../model/assets_model.dart';

class NativeBridge {
  NativeBridge._();

  static NativeBridge? _instance;

  static NativeBridge get instance => _instance ??= NativeBridge._();

  static final MethodChannel _channel = MethodChannel(
    AppConstants.channelName,
  );

  NavigationController get route => GetIt.I.get<NavigationController>();
  CustomSnack get snack => GetIt.I.get<CustomSnack>();
  final audioplayer = AudioPlayer();

  setupMethodChannel() {
    _channel.setMethodCallHandler(
      (MethodCall call) async {
        switch (call.method) {
          case AppConstants.settingsMethod:
            receiveAudioSettings(call);
            break;
          case AppConstants.goToPageMethod:
            goToPage(call);
            break;
          default:
            throw MissingPluginException();
        }
      },
    );
  }

  //Go to page
  void goToPage(MethodCall call) {
    String data = call.arguments.toString().replaceAll("\\", "");
    Map<String, dynamic> jsonMap = json.decode(data);

    final model = convertJsonToModule(jsonMap);

    route.push(name: model.page!, args: model);
  }

  //Send game Result
  Future<void> sendGameResult({required int value}) async {
    await _channel.invokeMethod(AppConstants.gameResult, value);
  }

  Future<void> sendAudioSettings({required bool value}) async {
    await _channel.invokeMethod(
      AppConstants.settingsMethod,
      {"music_enabled": value, "audio_enabled": value},
    );
  }

  Future<void> receiveAudioSettings(MethodCall call) async {
    String data = call.arguments.toString().replaceAll("\\", "");
    Map<String, dynamic> jsonMap = json.decode(data);

    AudioPreferences.setAudio(value: jsonMap['audio_enabled']);
    AudioPreferences.setMusic(value: jsonMap['music_enabled']);
  }

  GameModel convertJsonToModule(Map<String, dynamic> json) {
    return GameModel(
      page: json['page'],
      assets: (json['assets'] as List<dynamic>)
          .map((e) => AssetsModel(url: e['url'], value: e['value']))
          .toList(),
    );
  }
}
