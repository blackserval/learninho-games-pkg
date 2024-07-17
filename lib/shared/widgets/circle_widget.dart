import 'package:flutter/material.dart';

class CircleWidget extends StatelessWidget {
  final String? image;
  final Color? color;
  final Size size;

  const CircleWidget({
    super.key,
    this.image,
    this.color = Colors.transparent,
    this.size = const Size(80, 80),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: size.height,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        image: image == null
            ? null
            : DecorationImage(
                image: NetworkImage(image!),
                fit: BoxFit.cover,
              ),
      ),
    );
  }
}
