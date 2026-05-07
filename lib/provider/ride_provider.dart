import 'package:flutter/material.dart';

class RideProvider extends ChangeNotifier {
  final TextEditingController pickupController = TextEditingController();
  final TextEditingController dropController = TextEditingController();

  final FocusNode dropFocusNode = FocusNode();

  String _dropQuery = '';

  /// selected tab
  int _selectedTab = 0;

  int get selectedTab => _selectedTab;

  void changeTab(int index) {
    _selectedTab = index;
    notifyListeners();
  }

  String get dropQuery => _dropQuery;

  final List<Map<String, String>> allSuggestions = [

    {
      'title': 'Patna Junction railway station',
      'subtitle': 'New Market Station Rd, Fraser Road Area, Patna',
      'distance': '51 mi',
    },

    {
      'title': 'Patna Junction',
      'subtitle': 'Fraser Road Area, Patna, Bihar',
      'distance': '51 mi',
    },

    {
      'title': 'Jay Prakash Narayan International Airport',
      'subtitle': 'Sheikhpura, Patna, Bihar',
      'distance': '48 mi',
    },

    {
      'title': 'Rajendra Nagar Terminal Retiring Room',
      'subtitle': 'Rajendra Nagar, Patna',
      'distance': '53 mi',
    },

    {
      'title': 'Patliputra Station',
      'subtitle': 'Rukanpura, Patna, Bihar',
      'distance': '47 mi',
    },

  ];

  List<Map<String, String>> get filteredSuggestions {
    if (_dropQuery.trim().isEmpty) return allSuggestions;

    final q = _dropQuery.toLowerCase();

    return allSuggestions.where((p) {
      return p['title']!.toLowerCase().contains(q) ||
          p['subtitle']!.toLowerCase().contains(q);
    }).toList();
  }

  RideProvider() {
    pickupController.text = 'Kant Road';

    dropController.addListener(() {
      _dropQuery = dropController.text;
      notifyListeners();
    });
  }

  void onSuggestionTap(Map<String, String> place) {
    dropController.text = place['title']!;

    dropController.selection = TextSelection.fromPosition(
      TextPosition(offset: dropController.text.length),
    );

    notifyListeners();
  }

  @override
  void dispose() {
    pickupController.dispose();
    dropController.dispose();
    dropFocusNode.dispose();
    super.dispose();
  }
}
