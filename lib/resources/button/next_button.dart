import 'package:flutter/material.dart';
import '../colors/app_colors.dart';

class NextButton extends StatelessWidget {
  final int currentIndex;
  final int total;
  final VoidCallback onNext;
  final VoidCallback onDone;

  const NextButton({
    super.key,
    required this.currentIndex,
    required this.total,
    required this.onNext,
    required this.onDone,
  });

  @override
  Widget build(BuildContext context) {
    final isLast = currentIndex == total - 1;

    return Padding(
      padding: const EdgeInsets.all(20),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          minimumSize: const Size(double.infinity, 55),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onPressed: isLast ? onDone : onNext,
        child: Text(
          isLast ? "Get Started" : "Next",
          style: const TextStyle(fontSize: 18,color: AppColors.background),
        ),
      ),
    );
  }
}