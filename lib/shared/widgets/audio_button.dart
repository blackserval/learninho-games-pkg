import 'package:flutter/material.dart';

class AudioButton extends StatefulWidget {
  const AudioButton({super.key});

  @override
  State<AudioButton> createState() => _AudioButtonState();
}

class _AudioButtonState extends State<AudioButton> {
  bool soundOn = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: CircleAvatar(
        backgroundColor: Colors.grey[300],
        radius: 20,
        child: IconButton(
          onPressed: () {
            setState(() => soundOn = !soundOn);
          },
          icon: soundOn
              ? const Icon(Icons.volume_up_rounded)
              : const Icon(Icons.volume_off_rounded),
          color: Colors.grey[800],
        ),
      ),
    );
  }
}
