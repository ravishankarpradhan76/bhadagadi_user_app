import 'package:bhadagadi_user_app/provider/ride_provider.dart';
import 'package:bhadagadi_user_app/resources/colors/app_colors.dart';
import 'package:bhadagadi_user_app/resources/routes/routes_name.dart';
import 'package:bhadagadi_user_app/resources/strings/app_strings.dart';
import 'package:bhadagadi_user_app/view/ride_view/widgets/location_card.dart';
import 'package:bhadagadi_user_app/view/ride_view/widgets/ride_tab_button.dart';
import 'package:bhadagadi_user_app/view/ride_view/widgets/schedule_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RideView extends StatelessWidget {
  const RideView({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<RideProvider>(context);

    return Scaffold(
      backgroundColor: AppColors.bg,

      appBar: AppBar(
        backgroundColor: AppColors.bg,

        elevation: 0,

        title: const Text(AppStrings.planRide),
      ),

      body: Column(
        children: [
          const SizedBox(height: 20),

          /// LOCATION CARD
          LocationCard(provider: provider),

          const SizedBox(height: 30),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),

            child: Row(
              children: [
                /// BOOK NOW
                Expanded(
                  child: RideTabButton(
                    title: "Book Now",

                    isSelected: provider.selectedTab == 0,

                    onTap: () {
                      provider.changeTab(0);

                      Navigator.pushNamed(context, RoutesName.vehicleView);
                    },
                  ),
                ),

                const SizedBox(width: 16),

                /// SCHEDULE
                Expanded(
                  child: RideTabButton(
                    title: "Schedule",

                    isSelected: provider.selectedTab == 1,

                    onTap: () async {
                      provider.changeTab(1);

                      final pickedDate = await showDatePicker(
                        context: context,
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2100),
                        initialDate: DateTime.now(),
                      );

                      if (pickedDate == null) return;

                      final pickedTime = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      );

                      if (pickedTime == null) return;

                      showModalBottomSheet(
                        context: context,

                        backgroundColor: Colors.transparent,

                        isScrollControlled: true,

                        builder: (_) {
                          return ScheduleBottomSheet(
                            pickedDate: pickedDate,
                            pickedTime: pickedTime,
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          /// SUGGESTION LIST
          Expanded(
            child: ListView.builder(
              itemCount: provider.filteredSuggestions.length,

              itemBuilder: (context, index) {
                final place = provider.filteredSuggestions[index];

                return ListTile(
                  onTap: () => provider.onSuggestionTap(place),

                  leading: Text(place['distance']!),

                  title: Text(place['title']!),

                  subtitle: Text(place['subtitle']!),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
