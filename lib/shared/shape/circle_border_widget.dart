import 'package:flutter/material.dart';
import 'package:flutter_game_module/utils/responsive_widget.dart';

class CircleBorderWidget extends StatelessWidget {
  final String? image;
  final Color? color;

  const CircleBorderWidget({
    super.key,
    this.image,
    this.color = Colors.transparent,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width / 9,
      height: size.width / 9,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: Border.all(width: 1),
      ),
      child: image == null
          ? null
          : ClipOval(
              child: Image.network(
                image!,
                fit: BoxFit.cover,
                errorBuilder: (context, exception, stackTrace) {
                  return Icon(
                    Icons.error,
                    color: Colors.grey,
                    size: ResponsiveWidget.isMobile(context) ? 70 : 100,
                  );
                },
              ),
            ),
    );
  }
}
