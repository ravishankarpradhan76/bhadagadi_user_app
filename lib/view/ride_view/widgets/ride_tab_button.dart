import 'package:bhadagadi_user_app/resources/colors/app_colors.dart';

import 'package:flutter/material.dart';

class RideTabButton extends StatelessWidget {

  final String title;

  final bool isSelected;

  final VoidCallback onTap;

  const RideTabButton({

    super.key,

    required this.title,

    required this.isSelected,

    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    return GestureDetector(

      onTap: onTap,

      child: Container(

        height: 60,

        decoration: BoxDecoration(

          color: isSelected
              ? AppColors.background
              : AppColors.borderLight,

          border: Border.all(

            color: isSelected
                ? AppColors.primary
                : AppColors.textSecondary,

            width: 1.5,
          ),

          borderRadius: BorderRadius.circular(20),
        ),

        child: Center(

          child: Text(

            title,

            style: TextStyle(

              fontSize: 18,

              fontWeight: FontWeight.bold,

              color: isSelected
                  ? AppColors.primary
                  : AppColors.textSecondary,
            ),
          ),
        ),
      ),
    );
  }
}