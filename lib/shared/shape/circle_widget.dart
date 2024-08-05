import 'package:flutter/material.dart';
import 'package:flutter_game_module/utils/responsive_widget.dart';

class CircleWidget extends StatelessWidget {
  final String? image;
  final Color? color;

  const CircleWidget({super.key, this.image, this.color = Colors.transparent});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ResponsiveWidget.isMobile(context) ? 80 : 100,
      height: ResponsiveWidget.isMobile(context) ? 80 : 100,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
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
