import 'package:bhadagadi_user_app/resources/routes/routes_name.dart';
import 'package:bhadagadi_user_app/view/login/otp_view.dart';
import 'package:bhadagadi_user_app/view/onBoarding/onBoarding_view.dart';
import 'package:bhadagadi_user_app/view/signup/siginup_view.dart';
import 'package:bhadagadi_user_app/view/splash/splash_view.dart';
import 'package:flutter/material.dart';

import '../../view/login/login_view.dart';


class AppRoutes {

  static Route<dynamic>  generateRoute(RouteSettings settings){

    switch(settings.name){
      case RoutesName.splash:
        return MaterialPageRoute(builder: (BuildContext context) => const SplashView());

      case RoutesName.onBoarding:
        return MaterialPageRoute(builder: (BuildContext context) => const OnboardingView());

      case RoutesName.loginView:
        return MaterialPageRoute(builder: (BuildContext context) => const LoginView());

      case RoutesName.signupView:
        return MaterialPageRoute(builder: (BuildContext context) => const SignupView());

      case RoutesName.otpView :
        return MaterialPageRoute(builder: (BuildContext context) => const OtpView(), settings: settings,);

      default:
        return MaterialPageRoute(builder: (_){
          return const Scaffold(
            body: Center(
              child: Text('No route defined'),
            ),
          );
        });

    }
  }
}