import 'package:bhadagadi_user_app/resources/routes/routes_name.dart';
import 'package:flutter/material.dart';
import '../../resources/colors/app_colors.dart';
import '../../resources/strings/app_strings.dart';
import '../../resources/button/custom_button.dart';
import 'widgets/login_header.dart';
import 'widgets/phone_input_field.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController phoneController = TextEditingController();

  void _sendOtp() {
    final phone = phoneController.text.trim();

    if (phone.length != 10) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Enter valid mobile number")),
      );
      return;
    }

    Navigator.pushNamed(context, RoutesName.otpView,  arguments: phone);
  }

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),

              /// Header
              const LoginHeader(),

              const SizedBox(height: 30),

              /// Phone Input
              PhoneInputField(controller: phoneController),

              const SizedBox(height: 30),

              /// Button
              CustomButton(title: AppStrings.sendOtp, onTap: _sendOtp),

              const SizedBox(height: 30),

              /// Terms
              const Center(
                child: Text(
                  AppStrings.terms,
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 14,
                  ),
                ),
              ),
              const Spacer(),

              /// Signup
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account? ",
                      style: TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 15,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, RoutesName.signupView);
                      },
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
