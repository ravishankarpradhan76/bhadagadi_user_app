import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bhadagadi_user_app/resources/routes/routes_name.dart';
import '../../resources/button/custom_button.dart';
import '../../resources/colors/app_colors.dart';
import '../../resources/strings/app_strings.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isLoading = false;
  bool isObscure = true;

  void _sendOtp() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => isLoading = true);

    final name = nameController.text.trim();
    final phone = phoneController.text.trim();
    final password = passwordController.text.trim();

    await Future.delayed(const Duration(seconds: 1)); // mock API

    setState(() => isLoading = false);

    Navigator.pushReplacementNamed(
      context,
      RoutesName.otpView,
      arguments: phone,

    );
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),

                /// Title
                const Text(
                  AppStrings.createAccount,
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),

                const SizedBox(height: 8),

                const Text(
                  AppStrings.signMessage,
                  style: TextStyle(
                    fontSize: 15,
                    color: AppColors.textSecondary,
                  ),
                ),

                const SizedBox(height: 30),

                /// Full Name
                TextFormField(
                  controller: nameController,
                  textInputAction: TextInputAction.next,
                  decoration: _inputDecoration(AppStrings.fullName),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Enter full name";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 20),

                /// Mobile
                TextFormField(
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  maxLength: 10,
                  textInputAction: TextInputAction.next,
                  decoration: _inputDecoration(AppStrings.mobileNumber),
                  validator: (value) {
                    if (!RegExp(r'^[0-9]{10}$').hasMatch(value ?? "")) {
                      return "Enter valid mobile number";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 20),

                /// Password
                TextFormField(
                  controller: passwordController,
                  obscureText: isObscure,
                  textInputAction: TextInputAction.done,
                  decoration: _inputDecoration(AppStrings.password).copyWith(
                    suffixIcon: IconButton(
                      icon: Icon(
                        isObscure ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() => isObscure = !isObscure);
                      },
                    ),
                  ),
                  // validator: (value) {
                  //   if (!RegExp(
                  //     r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,}$',
                  //   ).hasMatch(value ?? "")) {
                  //     return "Min 6 chars with number";
                  //   }
                  //   return null;
                  // },
                ),

                const SizedBox(height: 30),

                /// Button
                CustomButton(
                  title: AppStrings.sendOtp,
                  isLoading: isLoading,
                  onTap: _sendOtp,
                ),

                const SizedBox(height: 30),

                /// Login Redirect
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      AppStrings.alreadyAcc,
                      style: TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 15,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacementNamed(
                          context,
                          RoutesName.loginView,
                        );
                      },
                      child: const Text(
                        AppStrings.login,
                        style: TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Common Input Decoration
  InputDecoration _inputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      counterText: "",
      filled: true,
      fillColor: AppColors.border,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide.none,
      ),
    );
  }
}
