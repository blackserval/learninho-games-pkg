import 'package:flutter/material.dart';
import 'package:flutter_game_module/repository/preferences/audio_preferences.dart';
import 'package:flutter_game_module/shared/custom_snack.dart';
import 'package:flutter_game_module/utils/native_bridge.dart';
import 'package:get_it/get_it.dart';

class AudioButton extends StatefulWidget {
  const AudioButton({super.key});

  @override
  State<AudioButton> createState() => _AudioButtonState();
}

class _AudioButtonState extends State<AudioButton> {
  final snack = GetIt.I.get<CustomSnack>();
  final nativeBridge = NativeBridge.instance;
  bool soundOn = false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      loadAudioData();
    });
    super.initState();
  }

  loadAudioData() async {
    soundOn = await AudioPreferences.getAudio();
    setState(() {});
  }

  onTap() {
    setState(() => soundOn = !soundOn);
    nativeBridge.sendAudioSettings(value: soundOn);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.only(bottom: 8),
      child: SafeArea(
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey[300],
              radius: 25,
              child: IconButton(
                onPressed: onTap,
                icon: soundOn
                    ? const Icon(Icons.volume_up_rounded)
                    : const Icon(Icons.volume_off_rounded),
                color: Colors.grey[800],
                iconSize: 28,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
