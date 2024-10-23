import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  bool _isExpanded = false;
   bool _isFirstPage = true;
  bool _isNavBarVisible = true;

  bool get isExpanded => _isExpanded;
  bool get isFirstPage => _isFirstPage;
  bool get isNavBarVisible => _isNavBarVisible;

  void toggleFirstPage() {
    _isFirstPage = !_isFirstPage;
    notifyListeners();
  }

  void toggleReadMore() {
    _isExpanded = !_isExpanded;
    _toggleNavBarVisibility();
    notifyListeners();
  }

  void _toggleNavBarVisibility() {
    _isNavBarVisible = !_isNavBarVisible;
    notifyListeners();
  }
}
