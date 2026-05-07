import 'package:bhadagadi_user_app/provider/choose_vehicle_provider.dart';
import 'package:bhadagadi_user_app/resources/button/custom_button.dart';
import 'package:bhadagadi_user_app/resources/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../resources/colors/app_colors.dart';

class ChoosevehicleView extends StatelessWidget {
  const ChoosevehicleView({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ChooseVehicleProvider>(context);

    return Scaffold(
      backgroundColor: AppColors.bg,

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              const SizedBox(height: 10),

              /// HEADER
              Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,

                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      shape: BoxShape.circle,
                    ),
                  ),

                  const SizedBox(width: 16),

                  const Text(
                    "Choose Vehicle",

                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 25),

              Divider(color: AppColors.subTitle),

              const SizedBox(height: 20),

              /// VEHICLE LIST
              Expanded(
                child: ListView.separated(
                  itemCount: provider.vehicles.length,

                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 18);
                  },

                  itemBuilder: (context, index) {
                    final vehicle = provider.vehicles[index];

                    final isSelected = provider.selectedIndex == index;

                    return GestureDetector(
                      onTap: () {
                        provider.selectVehicle(index);
                      },

                      child: Container(
                        padding: const EdgeInsets.all(20),

                        decoration: BoxDecoration(
                          color: isSelected
                              ? AppColors.primaryLight
                              : AppColors.background,

                          borderRadius: BorderRadius.circular(24),

                          border: Border.all(
                            color: isSelected
                                ? AppColors.primary
                                : Colors.grey.shade300,

                            width: 1.5,
                          ),
                        ),

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: [
                            /// LEFT
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,

                              children: [
                                Text(
                                  vehicle['title'],

                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,

                                    color: isSelected
                                        ? AppColors.primary
                                        : AppColors.subTitle,
                                  ),
                                ),

                                const SizedBox(height: 6),

                                Text(
                                  vehicle['subtitle'],

                                  style: TextStyle(
                                    fontSize: 16,
                                    color: AppColors.subTitle,
                                  ),
                                ),
                              ],
                            ),

                            /// RIGHT
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,

                              children: [
                                Text(
                                  vehicle['price'],

                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.textPrimary,
                                  ),
                                ),

                                const SizedBox(height: 6),

                                Text(
                                  "est. fare",

                                  style: TextStyle(
                                    fontSize: 15,
                                    color: AppColors.subTitle,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              CustomButton(
                title: 'Next',
                onTap: () {
                  final selectedVehicle =
                  provider.vehicles[provider.selectedIndex!];

                  Navigator.pushNamed(
                    context,
                    RoutesName.fareView,

                    arguments: {
                      "price": selectedVehicle['price'],
                    },
                  );
                },
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
