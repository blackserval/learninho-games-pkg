import 'package:flutter/material.dart';

class RectangleWidget extends StatelessWidget {
  final String? image;
  final Color? color;

  const RectangleWidget({
    super.key,
    this.image,
    this.color = Colors.transparent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 40,
      decoration: BoxDecoration(
        color: color,
        border: Border.all(),
        borderRadius: BorderRadius.circular(5),
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
