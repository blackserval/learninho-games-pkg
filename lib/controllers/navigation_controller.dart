import 'package:flutter/material.dart';

class NavigationController {
  final navigatorKey = GlobalKey<NavigatorState>();

  String pageReceived = "";

  Future<dynamic> push({required String name, Object? args}) {
    return navigatorKey.currentState!.pushNamed(
      name,
      arguments: args,
    );
  }

  Future<dynamic> replaceWith({required String name, Object? args}) {
    return navigatorKey.currentState!.pushReplacementNamed(
      name,
      arguments: args,
    );
  }

  Future<dynamic> removeUntil({required String name, Object? args}) {
    return navigatorKey.currentState!.pushNamedAndRemoveUntil(
      name,
      (Route<dynamic> route) => false,
      arguments: args,
    );
  }
}
