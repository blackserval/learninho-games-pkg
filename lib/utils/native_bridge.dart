import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart';
import 'package:flutter_game_module/config/constants.dart';
import 'package:flutter_game_module/controllers/navigation_controller.dart';
import 'package:flutter_game_module/model/game_model.dart';
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
          case AppConstants.goToPage:
            goToPage(call);
            break;
          default:
            throw MissingPluginException();
        }
      },
    );
  }

  //Go to page
  goToPage(MethodCall call) {
    String data = call.arguments.toString().replaceAll("\\", "");
    Map<String, dynamic> jsonMap = json.decode(data);

    final model = GameModel(
      page: jsonMap['page'],
      assets: (jsonMap['assets'] as List<dynamic>?)
          ?.map((e) => AssetsModel(
                url: e['url'] as String?,
                value: e['value'] as String?,
              ))
          .toList(),
    );

    route.push(name: model.page!, args: model);
  }

  //Send game Result
  Future<void> sendGameResult({required int value}) async {
    await _channel.invokeMethod(AppConstants.gameResult, value);
  }
}
