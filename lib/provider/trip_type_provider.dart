import 'package:flutter/material.dart';

class TripTypeProvider extends ChangeNotifier {

  final List<String> tripTypes = [
    "One-Way",
    "Round Trip",
    "In-City",
    "Outstation",
  ];

  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void selectTrip(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}