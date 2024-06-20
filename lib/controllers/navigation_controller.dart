import 'package:flutter/material.dart';

class NavigationController {
  final navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> push({required String name, required Object? args}) {
    return navigatorKey.currentState!.pushNamed(
      name,
      arguments: args,
    );
  }

  Future<dynamic> replaceWith({required String name, required Object? args}) {
    return navigatorKey.currentState!.pushReplacementNamed(
      name,
      arguments: args,
    );
  }

  Future<dynamic> removeUntil({required String name, required Object? args}) {
    return navigatorKey.currentState!.pushNamedAndRemoveUntil(
      name,
      (Route<dynamic> route) => false,
      arguments: args,
    );
  }
}
