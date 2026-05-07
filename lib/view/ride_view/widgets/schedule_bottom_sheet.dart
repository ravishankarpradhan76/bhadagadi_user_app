import 'package:bhadagadi_user_app/resources/button/custom_button.dart';
import 'package:bhadagadi_user_app/resources/colors/app_colors.dart';
import 'package:bhadagadi_user_app/resources/routes/routes_name.dart';

import 'package:flutter/material.dart';

class ScheduleBottomSheet extends StatelessWidget {

  final DateTime pickedDate;

  final TimeOfDay pickedTime;

  const ScheduleBottomSheet({

    super.key,

    required this.pickedDate,

    required this.pickedTime,
  });

  @override
  Widget build(BuildContext context) {

    return Container(

      padding: const EdgeInsets.all(22),

      decoration: const BoxDecoration(

        color: Colors.white,

        borderRadius: BorderRadius.vertical(
          top: Radius.circular(32),
        ),
      ),

      child: Column(

        mainAxisSize: MainAxisSize.min,

        crossAxisAlignment:
        CrossAxisAlignment.start,

        children: [

          Center(
            child: Container(
              width: 55,
              height: 5,

              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius:
                BorderRadius.circular(20),
              ),
            ),
          ),

          const SizedBox(height: 25),

          const Text(
            "Schedule Ride",

            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 25),

          ListTile(

            leading: const Icon(
              Icons.calendar_month,
              color: AppColors.primary,
            ),

            title: const Text("Selected Date"),

            subtitle: Text(
              "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}",
            ),
          ),

          ListTile(

            leading: const Icon(
              Icons.access_time,
              color: AppColors.primary,
            ),

            title: const Text("Selected Time"),

            subtitle: Text(
              pickedTime.format(context),
            ),
          ),

          const SizedBox(height: 20),

          CustomButton(

            title: "Confirm Booking",

            onTap: () {

              Navigator.pushNamed(context, RoutesName.vehicleView);
            },
          ),
        ],
      ),
    );
  }
}