import 'package:bhadagadi_user_app/resources/colors/app_colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final Color? color;
  final Color? titleColor;
  final double height;
  final bool isLoading;
  final bool showBorder;
  final Color? borderColor;

  const CustomButton({
    super.key,
    required this.title,
    required this.onTap,
    this.color,
    this.titleColor,
    this.height = 55,
    this.isLoading = false,
    this.showBorder = false,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? AppColors.primary,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
            side: showBorder
                ? BorderSide(
              color: borderColor ?? AppColors.primary,
              width: 1,
            )
                : BorderSide.none,
          ),
        ),
        onPressed: isLoading ? null : onTap,
        child: isLoading
            ? const SizedBox(
          height: 22,
          width: 22,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            color: Colors.white,
          ),
        )
            : Text(
          title,
          style: TextStyle(
            fontSize: 16,
            color: titleColor ?? Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}