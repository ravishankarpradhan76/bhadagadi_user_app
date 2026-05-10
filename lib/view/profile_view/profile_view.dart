import 'package:bhadagadi_user_app/resources/button/appbar.dart';
import 'package:bhadagadi_user_app/resources/routes/routes_name.dart';
import 'package:flutter/material.dart';

import '../../resources/colors/app_colors.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Padding(
              padding: EdgeInsets.fromLTRB(20, 24, 20, 0),
              child: CustomTitleBar(title: 'My Profile', onBack: (){
                Navigator.pop(context);
              })
            ),

            const SizedBox(height: 24),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 28),

                  // Avatar
                  Center(
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color(0xFFFFF8E7),
                        border: Border.all(
                          color: const Color(0xFFD4A843),
                          width: 2.5,
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          'C',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFB8860B),
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 14),

                  // Name
                  const Text(
                    'Chandan Pradhan',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),

                  const SizedBox(height: 4),

                  // Phone
                  const Text(
                    '+91 98765 43210',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF9E9E9E),
                    ),
                  ),

                  const SizedBox(height: 28),

                  // Divider
                  const Divider(height: 1, color: Color(0xFFE5E5EA)),

                  // Menu Items
                  _ProfileMenuItem(
                    title: 'Notifications',
                    onTap: () {
                      Navigator.pushNamed(context, RoutesName.notificationView);
                    },
                  ),
                  const Divider(height: 1, indent: 16, color: Color(0xFFE5E5EA)),
                  _ProfileMenuItem(
                    title: 'My Trips',
                    onTap: () {
                   Navigator.pushNamed(context, RoutesName.myTripView);
                    },
                  ),
                  const Divider(height: 1, indent: 16, color: Color(0xFFE5E5EA)),
                  _ProfileMenuItem(
                    title: 'Help & Support',
                    onTap: () {},
                  ),
                  const Divider(height: 1, indent: 16, color: Color(0xFFE5E5EA)),
                  _ProfileMenuItem(
                    title: 'Logout',
                    titleColor: const Color(0xFFD32F2F),
                    onTap: () {
                      _showLogoutDialog(context);
                    },
                    showChevron: false,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Logout'),
        content: const Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);

              Navigator.pushNamedAndRemoveUntil(
                context,
                RoutesName.loginView, // your login screen route
                    (route) => false,
              );
            },
            style: TextButton.styleFrom(
              foregroundColor: Colors.red,
            ),
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }
}

class _ProfileMenuItem extends StatelessWidget {
  final String title;
  final Color titleColor;
  final VoidCallback onTap;
  final bool showChevron;

  const _ProfileMenuItem({
    required this.title,
    this.titleColor = Colors.black,
    required this.onTap,
    this.showChevron = true,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  color: titleColor,
                ),
              ),
            ),
            if (showChevron)
              const Icon(
                Icons.chevron_right,
                color: Color(0xFFC7C7CC),
                size: 20,
              ),
          ],
        ),
      ),
    );
  }
}