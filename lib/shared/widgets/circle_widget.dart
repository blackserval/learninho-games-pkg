import 'package:flutter/material.dart';

class CircleWidget extends StatelessWidget {
  final String? image;
  final Color? color;

  const CircleWidget({super.key, this.image, this.color = Colors.transparent});

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: size.width / 6,
      // height: size.height / 6,
      width: 80,
      height: 80,
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
