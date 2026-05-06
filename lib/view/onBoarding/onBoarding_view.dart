import 'package:bhadagadi_user_app/resources/colors/app_colors.dart';
import 'package:bhadagadi_user_app/view/onBoarding/widgets/onboarding_model.dart';
import 'package:bhadagadi_user_app/view/onBoarding/widgets/page_indicator.dart';
import 'package:flutter/material.dart';
import '../../resources/button/next_button.dart';
import '../../resources/routes/routes_name.dart';


class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController _controller = PageController();
  int currentIndex = 0;

  final List<OnboardingModel> pages = [
    OnboardingModel(
      title: "Book rides instantly",
      subtitle: "Pick your vehicle, set destination, confirm trip in seconds",
    ),
    OnboardingModel(
      title: "Track your ride",
      subtitle: "Live tracking with driver details and ETA",
    ),
    OnboardingModel(
      title: "Safe & secure trips",
      subtitle: "Verified drivers and secure payments",
    ),
  ];

  Widget _buildPage(OnboardingModel model) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 120,
          width: 120,
          decoration: BoxDecoration(
            color: AppColors.primaryBorder,
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        const SizedBox(height: 30),

        Text(
          model.title,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 10),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            model.subtitle,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey.shade600),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screenBg,
      body: SafeArea(
        child: Column(
          children: [
            /// Pages
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: pages.length,
                onPageChanged: (index) {
                  setState(() => currentIndex = index);
                },
                itemBuilder: (context, index) {
                  return _buildPage(pages[index]);
                },
              ),
            ),

            /// Indicator
            PageIndicator(
              currentIndex: currentIndex,
              total: pages.length,
            ),

            const SizedBox(height: 20),
            NextButton(
              currentIndex: currentIndex,
              total: pages.length,
              onNext: () {
                _controller.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                );
              },
              onDone: () {
                Navigator.pushReplacementNamed(
                  context,
                  RoutesName.loginView,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}