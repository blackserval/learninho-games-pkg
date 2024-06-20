import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_game_module/config/constants.dart';

class NativeBridge {
  NativeBridge._();

  static NativeBridge? _instance;

  static NativeBridge get instance => _instance ??= NativeBridge._();

  static final MethodChannel _channel = MethodChannel(
    AppConstants.channelName,
  );

  setupMethodChannel() {
    _channel.setMethodCallHandler(
      (MethodCall call) async {
        switch (call.method) {
          case AppConstants.methodReceiveData:
            receiveDataFromSwiftUI(call.arguments);
          case AppConstants.methodOpenGameA:
            //route to game A
            break;
          default:
            throw MissingPluginException();
        }
      },
    );
  }

  receiveDataFromSwiftUI(dynamic data) async {
    debugPrint("Dados vindo do Swift $data");
  }

  static Future<void> sendDataToSwift(String data) async {
    try {
      await _channel.invokeMethod('sendDataToSwift', data);
    } catch (e) {
      debugPrint('Erro ao enviar dados para o Swift: $e');
    }
  }
}
