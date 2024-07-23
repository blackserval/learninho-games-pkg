import 'package:flutter/material.dart';
import 'package:flutter_game_module/repository/preferences/audio_preferences.dart';
import 'package:flutter_game_module/utils/native_bridge.dart';

class AudioButton extends StatefulWidget {
  const AudioButton({super.key});

  @override
  State<AudioButton> createState() => _AudioButtonState();
}

class _AudioButtonState extends State<AudioButton> {
  final nativeBridge = NativeBridge.instance;
  bool soundOn = true;

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
    return Padding(
      padding: const EdgeInsets.all(16),
      child: CircleAvatar(
        backgroundColor: Colors.grey[300],
        radius: 20,
        child: IconButton(
          onPressed: onTap,
          icon: soundOn
              ? const Icon(Icons.volume_up_rounded)
              : const Icon(Icons.volume_off_rounded),
          color: Colors.grey[800],
        ),
      ),
    );
  }
}
