import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomAppbar extends StatefulWidget implements PreferredSizeWidget {
  final VoidCallback refreh;

  const CustomAppbar({super.key, required this.refreh});

  @override
  State<CustomAppbar> createState() => _CustomAppbarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomAppbarState extends State<CustomAppbar> {
  bool soundOn = true;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: Padding(
        padding: const EdgeInsets.only(top: 12),
        child: CircleAvatar(
          backgroundColor: Colors.grey[300],
          radius: 20,
          child: IconButton(
            icon: const Icon(Icons.close),
            color: Colors.grey[800],
            onPressed: () {
              SystemNavigator.pop(animated: true);
            },
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(top: 12),
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
        ),
        const SizedBox(width: 16),
        Padding(
          padding: const EdgeInsets.only(top: 12, right: 16),
          child: CircleAvatar(
            backgroundColor: Colors.grey[300],
            radius: 20,
            child: IconButton(
              onPressed: widget.refreh,
              icon: const Icon(Icons.refresh),
            ),
          ),
        ),
      ],
    );
  }
}
