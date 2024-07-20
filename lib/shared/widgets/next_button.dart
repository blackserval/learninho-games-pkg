import 'package:flutter/material.dart';
import 'package:flutter_game_module/utils/responsive_widget.dart';

import '../theme/app_text.dart';

class NextButton extends StatelessWidget {
  final VoidCallback onTap;

  const NextButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ResponsiveWidget.isMobile(context) ? 200 : 250,
      height: ResponsiveWidget.isMobile(context) ? 50 : 80,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          elevation: 4,
        ),
        onPressed: onTap,
        child: FittedBox(
          child: Text(
            "Next",
            style: AppText.buttonText.copyWith(
              letterSpacing: 2,
              fontSize: ResponsiveWidget.isMobile(context) ? 22 : 32,
            ),
          ),
        ),
      ),
    );
  }
}
