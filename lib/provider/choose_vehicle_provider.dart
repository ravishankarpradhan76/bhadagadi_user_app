import 'package:flutter/material.dart';

class ChooseVehicleProvider extends ChangeNotifier {

  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  final List<Map<String, dynamic>> vehicles = [

    {
      "title": "Hatchback",
      "subtitle": "4 seats · AC",
      "price": "₹450",
    },

    {
      "title": "Sedan",
      "subtitle": "4 seats · AC",
      "price": "₹620",
    },

    {
      "title": "SUV",
      "subtitle": "6 seats · AC",
      "price": "₹850",
    },

    {
      "title": "Luxury",
      "subtitle": "4 seats · Premium",
      "price": "₹1,400",
    },
  ];

  void selectVehicle(int index) {

    _selectedIndex = index;
    notifyListeners();
  }

  Map<String, dynamic> get selectedVehicle {

    return vehicles[_selectedIndex];
  }
}