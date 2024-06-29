import 'package:haptic_feedback/haptic_feedback.dart';

class HapticHelper {
  HapticHelper._();

  static bool? canVibrate;

  static Future<void> vibrate(HapticsType type) async {
    canVibrate ??= await Haptics.canVibrate();

    if (canVibrate ?? false) await Haptics.vibrate(type);
  }
}
