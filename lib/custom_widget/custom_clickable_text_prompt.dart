import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../styles/app_colors.dart';

class CustomClickableTextPrompt extends StatelessWidget {
  final String promptText;
  final String actionText;
  final bool isUnderlined;
  final VoidCallback onTap;

  const CustomClickableTextPrompt({
    super.key,
    required this.promptText,
    required this.actionText,
    required this.onTap,
     this.isUnderlined=true,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          text: promptText,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.gray),
          children: [
            TextSpan(
              text: actionText,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(

                decoration: TextDecoration.underline,
              ),
              recognizer: TapGestureRecognizer()..onTap = onTap,
            ),
          ],
        ),
      ),
    );
  }
}
