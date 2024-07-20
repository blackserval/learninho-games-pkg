import 'package:flutter/material.dart';
import 'package:flutter_game_module/utils/responsive_widget.dart';

class ImageWidget extends StatelessWidget {
  final String image;
  final double? size;

  const ImageWidget({
    super.key,
    required this.image,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ResponsiveWidget.isMobile(context) ? size ?? 90 : 300,
      height: ResponsiveWidget.isMobile(context) ? size ?? 90 : 300,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: NetworkImage(image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
