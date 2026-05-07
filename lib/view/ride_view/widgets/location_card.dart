import 'package:bhadagadi_user_app/provider/ride_provider.dart';
import 'package:bhadagadi_user_app/resources/colors/app_colors.dart';

import 'package:flutter/material.dart';

class LocationCard extends StatelessWidget {

  final RideProvider provider;

  const LocationCard({
    super.key,
    required this.provider,
  });

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),

      child: Container(

        padding: const EdgeInsets.all(14),

        decoration: BoxDecoration(

          border: Border.all(
            color: AppColors.textPrimary,
            width: 2,
          ),

          borderRadius: BorderRadius.circular(14),
        ),

        child: Row(

          children: [

            Column(
              children: [

                const Icon(Icons.circle, size: 10),

                Container(
                  width: 2,
                  height: 22,
                  color: Colors.grey,
                ),

                const Icon(Icons.stop_rounded),
              ],
            ),

            const SizedBox(width: 12),

            Expanded(
              child: Column(

                children: [

                  TextField(
                    controller:
                    provider.pickupController,

                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),

                  const Divider(),

                  TextField(

                    controller:
                    provider.dropController,

                    focusNode:
                    provider.dropFocusNode,

                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Where to?",
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}