import 'package:bhadagadi_user_app/resources/button/custom_button.dart';
import 'package:flutter/material.dart';
import '../../resources/colors/app_colors.dart';
import '../../resources/routes/routes_name.dart';

class FindingDriverView extends StatefulWidget {
  const FindingDriverView({super.key});

  @override
  State<FindingDriverView> createState() => _FindingDriverViewState();
}

class _FindingDriverViewState extends State<FindingDriverView>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat();

    /// Navigate after 2 min
    Future.delayed(const Duration(seconds: 5), () {

      if(context.mounted){
        Navigator.pushNamed(context, RoutesName.assignDriver);
      }

    });
  }


  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,

      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// ANIMATION
              SizedBox(
                height: 220,
                width: 220,

                child: AnimatedBuilder(
                  animation: controller,

                  builder: (context, child) {
                    return Stack(
                      alignment: Alignment.center,
                      children: [
                        /// OUTER WAVE
                        buildWave(
                          size: 180 + (controller.value * 30),
                          opacity: 1 - controller.value,
                        ),

                        /// MIDDLE WAVE
                        buildWave(
                          size: 140 + (controller.value * 20),
                          opacity: 0.7 - (controller.value * 0.7),
                        ),

                        /// CENTER CIRCLE
                        Container(
                          height: 95,
                          width: 95,

                          decoration: BoxDecoration(
                            color: AppColors.background,
                            shape: BoxShape.circle,

                            border: Border.all(color: AppColors.primary, width: 3),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),

              const SizedBox(height: 35),

              /// TITLE
              const Text(
                "Finding your driver...",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),

              const SizedBox(height: 10),

              /// SUBTITLE
              Text(
                "Est. wait: 3–5 min",
                style: TextStyle(
                  fontSize: 18,
                  color: AppColors.subTitle,
                  fontWeight: FontWeight.w500,
                ),
              ),

              const SizedBox(height: 40),

              /// Cancel BUTTON
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: CustomButton(
                  title: "Cancel Request",
                  color: AppColors.background,
                  showBorder: true,
                  borderColor: AppColors.textSecondary,
                  titleColor: AppColors.textSecondary,
                  onTap: () {
                    Navigator.pushNamed(context, RoutesName.dashboardView);
                  },
                ),
              )          ,
            ],
          ),
        ),
      ),
    );
  }

  Widget buildWave({required double size, required double opacity}) {
    return Container(
      height: size,
      width: size,

      decoration: BoxDecoration(
        shape: BoxShape.circle,

        border: Border.all(color: Colors.orange.withOpacity(opacity), width: 4),
      ),
    );
  }
}
