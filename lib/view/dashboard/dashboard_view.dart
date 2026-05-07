import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/trip_type_provider.dart';
import '../../resources/button/custom_button.dart';
import '../../resources/colors/app_colors.dart';
import '../../resources/routes/routes_name.dart';
import '../../resources/strings/app_strings.dart';

class DashboardView extends StatelessWidget {
  DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TripTypeProvider>(context);

    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.bg,
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: AppColors.primary,
            child: Icon(Icons.person, color: AppColors.backgroundLight),
          ),
        ),
        title: Container(
          height: 45,
          decoration: BoxDecoration(
            color: AppColors.border,
            borderRadius: BorderRadius.circular(22),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 5),
            ],
          ),
          child: TextField(
            readOnly: true,
            onTap: () {
              Navigator.pushNamed(context, RoutesName.rideView);
            },
            decoration: const InputDecoration(
              hintText: AppStrings.whereTo,
              hintStyle: TextStyle(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
              prefixIcon: Icon(Icons.search, color: AppColors.textPrimary),
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(vertical: 12),
            ),
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: Icon(Icons.notifications_none, color: AppColors.textPrimary),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text(
              AppStrings.selectTripType,
              style: TextStyle(
                fontSize: 20,
                color: AppColors.textSecondary,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 25),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount:provider.tripTypes.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 2.6,
              ),
              itemBuilder: (context, index) {
                bool isSelected = provider.selectedIndex == index;

                return GestureDetector(
                  onTap: () {
                    provider.selectTrip(index);
                  },

                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: isSelected
                          ? AppColors.primaryLight
                          : Colors.grey.shade100,

                      borderRadius: BorderRadius.circular(18),

                      border: Border.all(
                        color: isSelected
                            ? AppColors.primary
                            : Colors.grey.shade400,
                      ),
                    ),

                    child: Text(
                      provider.tripTypes[index],

                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,

                        color: isSelected ? AppColors.primary : Colors.grey,
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 30),

            CustomButton(title: 'Continue', onTap: () {}),
          ],
        ),
      ),
    );
  }
}
