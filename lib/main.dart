import 'package:bhadagadi_user_app/provider/choose_vehicle_provider.dart';
import 'package:bhadagadi_user_app/provider/ride_provider.dart';
import 'package:bhadagadi_user_app/provider/trip_type_provider.dart';
import 'package:bhadagadi_user_app/resources/routes/routes.dart';
import 'package:bhadagadi_user_app/resources/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TripTypeProvider()),
        ChangeNotifierProvider(create: (_) => RideProvider()),
        ChangeNotifierProvider(create: (_) => ChooseVehicleProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),

      initialRoute: RoutesName.splash,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
