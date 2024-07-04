import 'package:flutter/material.dart';

class AppTheme {
  static const appBorderRadius = 20.0;

  static final theme = ThemeData(
    fontFamily: 'Fredoka',
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(appBorderRadius),
        ),
      ),
    ),
  );
}
