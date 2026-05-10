import 'package:bhadagadi_user_app/resources/colors/app_colors.dart';
import 'package:bhadagadi_user_app/resources/strings/app_strings.dart';
import 'package:bhadagadi_user_app/view/asign_driver/widgets/driver_documents.dart';
import 'package:flutter/material.dart';

import '../../resources/button/appbar.dart';

class DriverAssignedView extends StatelessWidget {
  const DriverAssignedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTitleBar(
                title: AppStrings.driverAssigned,
                onBack: () {
                  Navigator.pop(context);
                },
              ),

              const SizedBox(height: 8),

              const Text(
                AppStrings.arrivingSoon,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColors.success,
                ),
              ),

              const SizedBox(height: 18),

              Divider(color: AppColors.subTitle),

              const SizedBox(height: 24),

              /// DRIVER CARD
              Container(
                padding: const EdgeInsets.all(22),

                decoration: BoxDecoration(
                  color: AppColors.background,
                  borderRadius: BorderRadius.circular(28),

                  border: Border.all(color: AppColors.border),
                ),

                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 110,
                          width: 110,
                          decoration: const BoxDecoration(
                            color: AppColors.primaryBorder,
                            shape: BoxShape.circle,
                          ),

                          child: const Center(
                            child: Text(
                              "R",
                              style: TextStyle(
                                fontSize: 46,
                                fontWeight: FontWeight.bold,
                                color: AppColors.chipText,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(width: 22),

                        /// DETAILS
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,

                                children: [
                                  /// NAME
                                  const Expanded(
                                    child: Text(
                                      "Ravi Kumar",
                                      style: TextStyle(
                                        fontSize: 24,
                                        height: 1.2,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 15),

                               Text(
                                "4.8 •\n1,240 trips",
                                style: TextStyle(
                                  fontSize: 16,
                                  height: 1.3,
                                  color: AppColors.cardgrey,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),

                    Divider(color: AppColors.subTitle),

                    const SizedBox(height: 18),

                    /// VEHICLE
                     Row(
                      children: [
                        Text(
                          AppStrings.vehicle,
                          style: TextStyle(fontSize: 18, color: AppColors.cardgrey),
                        ),

                        Spacer(),

                        Text(
                          "Swift · BR01 XY 4567",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              /// ACTION BUTTONS
              Row(
                children: [
                  Expanded(
                    child: actionButton(
                      onTap: (){},
                      title: "Chat",
                      color: AppColors.background,
                      textColor: AppColors.cardgrey,
                    ),
                  ),

                  const SizedBox(width: 16),

                  Expanded(
                    child: actionButton(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => DriverDocumentsView()));
                      },
                      title: "Docs",
                      color: AppColors.background,
                      textColor: AppColors.cardgrey,
                    ),
                  ),

                  const SizedBox(width: 16),

                  Expanded(
                    child: actionButton(
                      onTap: (){},
                      title: "SOS",
                      color: AppColors.background,
                      textColor: AppColors.cardgrey,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget actionButton({
    required String title,
    required Color color,
    required Color textColor,
    Color? borderColor,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 82,

        decoration: BoxDecoration(
          color: color,

          borderRadius: BorderRadius.circular(22),

          border: Border.all(color: borderColor ?? Colors.grey.shade300),
        ),

        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
