import 'package:flutter/material.dart';

import '../constants/app_text_styles.dart';

class CustomErrorWidget extends StatelessWidget {
  final String message;
  final VoidCallback onPressed;

  const CustomErrorWidget({
    Key? key,
    required this.message,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Error Icon
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.red.withValues(alpha: 0.1),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.error_outline,
            size: 25,
            color: Colors.red,
          ),
        ),
        const SizedBox(height: 24),

        // Error Message
        Text(
          message,
          textAlign: TextAlign.center,
          style: AppTextStyles.text16DarkGreenW700,
        ),
        const SizedBox(height: 24),

        // Retry Button
        ElevatedButton.icon(
          onPressed: onPressed,
          icon: const Icon(Icons.refresh),
          label: const Text('إعادة المحاولة'),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ],
    );
  }
}
