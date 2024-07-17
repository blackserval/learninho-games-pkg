import 'package:flutter/material.dart';

class CustomBottomBar extends StatefulWidget {
  const CustomBottomBar({super.key});

  @override
  State<CustomBottomBar> createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  bool soundOn = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Row(
        children: [
          CircleAvatar(
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
        ],
      ),
    );
  }
}
