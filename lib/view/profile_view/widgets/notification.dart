import 'package:flutter/material.dart';

import '../../../resources/button/appbar.dart';
import '../../../resources/colors/app_colors.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> notifications = [
      {
        "title": "Don’t miss today’s ₹0 commute 💸",
        "subtitle":
        "Use Code: METRO & unlock your FREE Metro ticket.",
        "time": "52 minutes ago",
      },
      {
        "title": "ETA looking risky ⏳",
        "subtitle":
        "Bike-Taxi can still save the situation 🛵",
        "time": "5 hours ago",
      },
      {
        "title": "METRO50 Active Now 💸",
        "subtitle":
        "Get 50% OFF on metro tickets. Tap to book instantly ⚡",
        "time": "23 hours ago",
      },
      {
        "title": "Didn’t book yet?",
        "subtitle":
        "Book metro on Rapido & get FREE metro with code METRO.",
        "time": "23 hours ago",
      },
      {
        "title": "Bro, this ride is completely FREE 🤝",
        "subtitle":
        "Use Code METRO & grab your Metro ticket now.",
        "time": "1 day ago",
      },
      {
        "title": "Loading shortcut...",
        "subtitle":
        "Complete the last step. Book a Bike-Taxi & zoom out 🛵",
        "time": "2 days ago",
      },
    ];

    return Scaffold(
      backgroundColor: AppColors.bg,

      body: SafeArea(
        child: Column(
          children: [

            CustomTitleBar(title: 'Notifications', onBack: () { Navigator.pop(context); },),
            /// LIST
            Expanded(
              child: ListView.separated(
                itemCount: notifications.length,

                separatorBuilder: (context, index) {
                  return const Divider(
                    thickness: 1,
                    color: Color(0xffEAEAEA),
                  );
                },

                itemBuilder: (context, index) {
                  final item = notifications[index];

                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 14,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        /// DOT
                        Container(
                          margin: const EdgeInsets.only(top: 8),
                          width: 12,
                          height: 12,
                          decoration: const BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle,
                          ),
                        ),

                        const SizedBox(width: 16),

                        /// TEXT
                        Expanded(
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [

                              Text(
                                item["title"]!,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.textPrimary,
                                ),
                              ),

                              const SizedBox(height: 5),

                              Text(
                                item["subtitle"]!,
                                style: TextStyle(
                                  fontSize: 16,
                                  height: 1.4,
                                  color: AppColors.subTitle,
                                ),
                              ),

                              const SizedBox(height: 10),

                              Text(
                                item["time"]!,
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}