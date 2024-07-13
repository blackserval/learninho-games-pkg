import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback refreh;

  const CustomAppbar({super.key, required this.refreh});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: Padding(
        padding: const EdgeInsets.only(top: 12),
        child: CircleAvatar(
          backgroundColor: Colors.grey[300],
          radius: 25,
          child: IconButton(
            icon: const Icon(Icons.close),
            color: Colors.grey[800],
            onPressed: () {},
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(top: 12),
          child: CircleAvatar(
            backgroundColor: Colors.grey[300],
            radius: 25,
            child: IconButton(
              onPressed: refreh,
              icon: const Icon(Icons.refresh),
            ),
          ),
        ),
      ],
    );
  }
}
