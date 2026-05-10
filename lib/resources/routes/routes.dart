import 'package:bhadagadi_user_app/resources/routes/routes_name.dart';
import 'package:bhadagadi_user_app/view/asign_driver/assign_driver_view.dart';
import 'package:bhadagadi_user_app/view/dashboard/dashboard_view.dart';
import 'package:bhadagadi_user_app/view/find_driver/find_driver_view.dart';
import 'package:bhadagadi_user_app/view/login/otp_view.dart';
import 'package:bhadagadi_user_app/view/onBoarding/onBoarding_view.dart';
import 'package:bhadagadi_user_app/view/profile_view/profile_view.dart';
import 'package:bhadagadi_user_app/view/profile_view/widgets/my_trips.dart';
import 'package:bhadagadi_user_app/view/profile_view/widgets/notification.dart';
import 'package:bhadagadi_user_app/view/ride_view/ride_view.dart';
import 'package:bhadagadi_user_app/view/signup/siginup_view.dart';
import 'package:bhadagadi_user_app/view/splash/splash_view.dart';
import 'package:bhadagadi_user_app/view/trip_view/trip_summary_view.dart';
import 'package:flutter/material.dart';
import '../../view/login/login_view.dart';
import '../../view/vehicle_view/vehicle_type_view.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splash:
        return MaterialPageRoute(
          builder: (BuildContext context) => const SplashView(),
        );

      case RoutesName.onBoarding:
        return MaterialPageRoute(
          builder: (BuildContext context) => const OnboardingView(),
        );

      case RoutesName.loginView:
        return MaterialPageRoute(
          builder: (BuildContext context) => const LoginView(),
        );

      case RoutesName.signupView:
        return MaterialPageRoute(
          builder: (BuildContext context) => const SignupView(),
        );

      case RoutesName.otpView:
        return MaterialPageRoute(
          builder: (BuildContext context) => const OtpView(),
          settings: settings,
        );

      case RoutesName.dashboardView:
        return MaterialPageRoute(
          builder: (BuildContext context) => DashboardView(),
        );

      case RoutesName.rideView:
        return MaterialPageRoute(
          builder: (BuildContext context) => const RideView(),
        );

      case RoutesName.vehicleView:
        return MaterialPageRoute(
          builder: (BuildContext context) => const ChoosevehicleView(),
        );

      case RoutesName.tripView:
        return MaterialPageRoute(
          builder: (BuildContext context) => const TripSummaryView(),
        );

      case RoutesName.findDriver:
        return MaterialPageRoute(
          builder: (BuildContext context) => const FindingDriverView(),
        );

      case RoutesName.assignDriver:
        return MaterialPageRoute(
          builder: (BuildContext context) => const DriverAssignedView(),
        );

      case RoutesName.profileView:
        return MaterialPageRoute(
          builder: (BuildContext context) => const ProfileView(),
        );

      case RoutesName.myTripView:
        return MaterialPageRoute(
          builder: (BuildContext context) => const MyTripView(),
        );

      case RoutesName.notificationView:
        return MaterialPageRoute(
          builder: (BuildContext context) => const NotificationView(),
        );


      default:
        return MaterialPageRoute(
          builder: (_) {
            return const Scaffold(
              body: Center(child: Text('No route defined')),
            );
          },
        );
    }
  }
}
