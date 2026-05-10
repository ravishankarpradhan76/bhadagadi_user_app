import 'package:flutter/material.dart';
import '../colors/app_colors.dart';

class CustomTitleBar extends StatelessWidget {
  final String title;
  final VoidCallback onBack;

  const CustomTitleBar({
    super.key,
    required this.title,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: onBack,
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
          ),
        ),
        Text(
          title,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
      ],
    );
  }
}