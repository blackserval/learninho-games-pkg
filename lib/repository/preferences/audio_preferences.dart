import 'package:shared_preferences/shared_preferences.dart';

class AudioPreferences {
  static String musicKey = "music_enable";
  static String audioKey = "audio_enable";

  //Set
  //
  static Future<void> setAudio({required bool value}) async {
    final shared = await SharedPreferences.getInstance();

    shared.setBool(audioKey, value);
  }

  static Future<void> setMusic({required bool value}) async {
    final shared = await SharedPreferences.getInstance();

    shared.setBool(musicKey, value);
  }

  //Get
  //
  static Future<bool?> getAudio() async {
    final shared = await SharedPreferences.getInstance();
    return shared.getBool(audioKey);
  }
}
