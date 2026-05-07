import 'dart:async';
import 'package:bhadagadi_user_app/resources/button/custom_button.dart';
import 'package:bhadagadi_user_app/resources/routes/routes_name.dart';
import 'package:bhadagadi_user_app/resources/strings/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../../resources/colors/app_colors.dart';

class OtpView extends StatefulWidget {
  const OtpView({super.key});

  @override
  State<OtpView> createState() => _OtpViewState();
}

class _OtpViewState extends State<OtpView> {
  int seconds = 30;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (seconds == 0) {
        t.cancel();
      } else {
        setState(() => seconds--);
      }
    });
  }

  void resendOtp() {
    setState(() => seconds = 30);
    startTimer();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final phone =
        ModalRoute.of(context)?.settings.arguments as String? ?? "";
    final defaultPinTheme = PinTheme(
      width: 60,
      height: 60,
      textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.orange),
      ),
    );

    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              const Text(
                AppStrings.verifyOtp,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),

              const SizedBox(height: 8),

               Text(
                "Sent to +91 $phone",
                style: TextStyle(fontSize: 15, color: AppColors.textSecondary),
              ),

              const SizedBox(height: 40),

              /// Pinput
              Center(
                child: Pinput(
                  length: 4,
                  defaultPinTheme: defaultPinTheme,
                  onCompleted: (pin) {
                    print("OTP: $pin");
                  },
                ),
              ),

              const SizedBox(height: 30),

              /// Resend
              Center(
                child: seconds == 0
                    ? GestureDetector(
                        onTap: resendOtp,
                        child: const Text(
                          "Resend OTP",
                          style: TextStyle(color: Colors.orange),
                        ),
                      )
                    : Text(
                        "Resend in ${seconds}s",
                        style: const TextStyle(color: Colors.grey),
                      ),
              ),

              const SizedBox(height: 30),

              /// Button
             CustomButton(title: AppStrings.verifyContinue, onTap: (){
               Navigator.pushNamed(context, RoutesName.dashboardView);
             })
            ],
          ),
        ),
      ),
    );
  }
}
