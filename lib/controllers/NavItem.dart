import 'package:flutter/material.dart';
import 'package:neocloud_mobile/models/Students.dart';
import 'package:neocloud_mobile/screens/Profile/profile_sceen.dart';
import 'package:neocloud_mobile/screens/academic/academic_screen.dart';
import 'package:neocloud_mobile/screens/dashboard/dashboard_screen.dart';
import 'package:neocloud_mobile/screens/search/search_screen.dart';

class NavItem {
  final String svgActive;
  final String svgInactive;
  final String itemLabel;
  final Widget destination;

  const NavItem({
    required this.svgActive,
    required this.svgInactive,
    required this.itemLabel,
    required this.destination,
  });
}

class NavItems extends ChangeNotifier {
  int _selectedIndex = 0;

  void changeNavIndex(int index) {
    _selectedIndex = index;

    notifyListeners();
  }

  int getSelectedIndex() => _selectedIndex;

  List<NavItem> items = [
    const NavItem(
      svgActive: "assets/icons/navbar/home-fill.svg",
      svgInactive: "assets/icons/navbar/home-outline.svg",
      itemLabel: "Home",
      destination: DashboardScreen(),
    ),
    const NavItem(
      svgActive: "assets/icons/navbar/search-fill.svg",
      svgInactive: "assets/icons/navbar/search-outline.svg",
      itemLabel: "Academic",
      destination: SearchScreen(),
    ),
    const NavItem(
      svgActive: "assets/icons/navbar/book-fill.svg",
      svgInactive: "assets/icons/navbar/book-outline.svg",
      itemLabel: "Dashboard",
      destination: AcademicScreen(),
    ),
    NavItem(
      svgActive: "assets/icons/navbar/notification-fill.svg",
      svgInactive: "assets/icons/navbar/notification-outline.svg",
      itemLabel: "Back Office",
      destination: ProfileScreen(user: users[0]),
    ),
    NavItem(
      svgActive: "assets/icons/navbar/user-fill.svg",
      svgInactive: "assets/icons/navbar/user-outline.svg",
      itemLabel: "Finance",
      destination: ProfileScreen(user: users[0]),
    ),
  ];
}
