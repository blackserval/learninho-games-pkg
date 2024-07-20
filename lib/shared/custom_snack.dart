import 'package:flutter/material.dart';

import 'theme/app_theme.dart';

class CustomSnack {
  final snackbarKey = GlobalKey<ScaffoldMessengerState>();

  SnackBar _appSnack({
    required String title,
    required Widget icon,
    required Color color,
  }) {
    return SnackBar(
      content: Row(
        children: [
          icon,
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              title,
              maxLines: 10,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ],
      ),
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 10),
      backgroundColor: color,
      showCloseIcon: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppTheme.appBorderRadius),
      ),
    );
  }

  success({required String text}) {
    snackbarKey.currentState!.showSnackBar(
      _appSnack(
        title: text,
        icon: const Icon(Icons.check, color: Colors.white),
        color: Colors.green,
      ),
    );
  }

  error({required String text}) {
    snackbarKey.currentState!.showSnackBar(
      _appSnack(
        title: text,
        icon: const Icon(Icons.error, color: Colors.white),
        color: Colors.red,
      ),
    );
  }

  loading({required String text}) {
    snackbarKey.currentState!.showSnackBar(
      _appSnack(
        title: text,
        icon: const Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(Colors.white),
          ),
        ),
        color: Colors.yellow,
      ),
    );
  }

  warning({required String text}) {
    snackbarKey.currentState!.showSnackBar(
      _appSnack(
        title: text,
        icon: const Icon(
          Icons.warning_amber_rounded,
          color: Colors.white,
        ),
        color: Colors.yellow[900]!,
      ),
    );
  }
}
