import 'package:flutter/material.dart';

class DrawerProvider extends ChangeNotifier {
  int selectedIndex = 0;          // Main menu index
  int? selectedBlogSubIndex;      // Blog inner index
  bool isBlogExpanded = false;    // Blog open/close

  /// Select main menu
  void selectMain(int index) {
    selectedIndex = index;
    selectedBlogSubIndex = null;
    isBlogExpanded = false;
    notifyListeners();
  }

  /// Select blog main
  void selectBlogMain() {
    selectedIndex = -1;
    selectedBlogSubIndex = 0;     // OUR BLOG

    notifyListeners();
  }

  /// Select blog sub item
  void selectBlogSub(int subIndex) {
    selectedIndex = -1;
    selectedBlogSubIndex = subIndex;

    notifyListeners();
  }

  /// Toggle blog expand
  void toggleBlogExpand() {
    isBlogExpanded = !isBlogExpanded;
    notifyListeners();
  }
}
