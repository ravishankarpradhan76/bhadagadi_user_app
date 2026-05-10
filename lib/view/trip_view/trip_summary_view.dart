import 'package:bhadagadi_user_app/resources/button/custom_button.dart';
import 'package:bhadagadi_user_app/resources/routes/routes_name.dart';
import 'package:bhadagadi_user_app/resources/strings/app_strings.dart';
import 'package:flutter/material.dart';
import '../../resources/button/appbar.dart';
import '../../resources/colors/app_colors.dart';

class TripSummaryView extends StatelessWidget {
  const TripSummaryView({super.key});

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
                title: AppStrings.tripSummary,
                onBack: () {
                  Navigator.pop(context);
                },
              ),

              const SizedBox(height: 25),

              const Divider(),

              const SizedBox(height: 25),

              /// PICKUP & DROP
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Column(
                    children: [
                      Container(
                        height: 18,
                        width: 18,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.primary,
                            width: 4,
                          ),
                        ),
                      ),

                      Container(
                        height: 45,
                        width: 2,
                        color: AppColors.subTitle,
                      ),

                      Container(
                        height: 18,
                        width: 18,
                        decoration: const BoxDecoration(
                          color: AppColors.primary,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(width: 18),

                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text(
                          "Patna Junction",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        SizedBox(height: 45),

                        Text(
                          "AIIMS Patna",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),

              const SizedBox(height: 25),

              const Divider(),

              const SizedBox(height: 20),

              /// PAYMENT
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 22,
                ),

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.grey.shade300,
                  ),
                ),

                child:  Row(
                  children: [

                    Text(
                   AppStrings.payment,
                      style: TextStyle(
                        color: AppColors.cardgrey,
                        fontSize: 18,
                      ),
                    ),

                    Spacer(),

                    Text(
                      "Cash · ₹450",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 45),

              /// CONFIRM BUTTON
             CustomButton(title: 'Conform Ride', onTap: (){
              Navigator.pushNamed(context, RoutesName.findDriver);
             }),

              const SizedBox(height: 25),

              /// CANCEL BUTTON
              CustomButton(
                title: "Cancel",
                color: AppColors.background,
                showBorder: true,
                borderColor: AppColors.textSecondary,
                titleColor: AppColors.textSecondary,
                onTap: () {
                  Navigator.pushNamed(context, RoutesName.dashboardView);
                },
              )            ],
          ),
        ),
      ),
    );
  }
}