import 'package:flutter/material.dart';

import '../theme/app_text.dart';

class NextButton extends StatelessWidget {
  final VoidCallback onTap;

  const NextButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 50,
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
              fontSize: 22,
            ),
          ),
        ),
      ),
    );
  }
}
