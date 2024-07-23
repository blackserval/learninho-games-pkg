import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_game_module/repository/preferences/audio_preferences.dart';

class AudioController {
  final audioPlayer = AudioPlayer();

  Future<void> playSound({required String song}) async {
    if (await _canPlaySound()) {
      debugPrint("--PlaySound--");
      audioPlayer.play(AssetSource(song));
    }
  }

  Future<bool> _canPlaySound() async {
    debugPrint("--CanPlaySound--");
    return await AudioPreferences.getAudio() ?? false;
  }
}
