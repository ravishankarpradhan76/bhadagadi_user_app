import 'package:flutter/material.dart';

import '../../../resources/colors/app_colors.dart';
import '../../../resources/strings/app_strings.dart';

class PhoneInputField extends StatelessWidget {
  final TextEditingController controller;

  const PhoneInputField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
      decoration: BoxDecoration(
        color: AppColors.border,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          const Text("+91", style: TextStyle(fontSize: 16)),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: controller,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                hintText: AppStrings.mobileNumber,
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
