import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_game_module/config/constants.dart';
import 'package:flutter_game_module/controllers/navigation_controller.dart';
import 'package:flutter_game_module/routes/app_pages.dart';
import 'package:get_it/get_it.dart';

class NativeBridge {
  NativeBridge._();

  static NativeBridge? _instance;

  static NativeBridge get instance => _instance ??= NativeBridge._();

  static final MethodChannel _channel = MethodChannel(
    AppConstants.channelName,
  );

  NavigationController get route => GetIt.I.get<NavigationController>();

  setupMethodChannel() {
    _channel.setMethodCallHandler(
      (MethodCall call) async {
        switch (call.method) {
          case AppConstants.methodTimeTravel1:
            route.push(name: AppPages.timeTravel1);
            break;
          case AppConstants.methodTimeTravel2:
            route.push(name: AppPages.timeTravel2);
            break;
          case AppConstants.methodMagicWord1:
            route.push(name: AppPages.magicWord1);
            break;
          case AppConstants.methodMagicWord2:
            route.push(name: AppPages.magicWord2);
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
