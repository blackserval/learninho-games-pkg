import 'package:flutter/material.dart';

import '../../../utils/responsive_widget.dart';

class CardWidget extends StatelessWidget {
  final String image;

  const CardWidget({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ResponsiveWidget.isMobile(context) ? 100 : 200,
      height: ResponsiveWidget.isMobile(context) ? 100 : 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        image: DecorationImage(
          image: NetworkImage(image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
