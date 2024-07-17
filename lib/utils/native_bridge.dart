import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_game_module/config/constants.dart';
import 'package:flutter_game_module/controllers/navigation_controller.dart';
import 'package:flutter_game_module/shared/custom_snack.dart';
import 'package:get_it/get_it.dart';

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
            route.push(name: call.arguments);
            break;
          default:
            throw MissingPluginException();
        }
      },
    );
  }

  //Receive data
  //
  receiveDataFromNative(dynamic data) async {
    debugPrint("Dados vindo do Swift $data");
  }

  //Send data
  //
  // static Future<void> sendDataToNative(String data) async {
  //   try {
  //     await _channel.invokeMethod(AppConstants.methodSendDataToNative, data);
  //   } catch (e) {
  //     debugPrint('Erro ao enviar dados para o Swift: $e');
  //   }
  // }
}
