import 'package:flutter/material.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/screens/academic/academic_screen.dart';
import 'package:neocloud_mobile/screens/back_office/back_office_screen.dart';
import 'package:neocloud_mobile/screens/class_works/class_works_screen.dart';
import 'package:neocloud_mobile/screens/dashboard/dashboard_screen.dart';
import 'package:neocloud_mobile/screens/finance/finance_screen.dart';

class NavItem {
  final Icon iconActive;
  final Icon iconInactive;
  final String itemLabel;
  final Widget destination;

  const NavItem({
    required this.iconActive,
    required this.iconInactive,
    required this.itemLabel,
    required this.destination,
  });
}

class NavItems extends ChangeNotifier {
  int _selectedIndex = 2;

  void changeNavIndex(int index) {
    // if (index >= 5){
    //   throw ArgumentError()
    // }
    _selectedIndex = index;

    notifyListeners();
  }

  int getSelectedIndex() => _selectedIndex;

  List<NavItem> items = [
    NavItem(
      iconActive: Icon(Icons.book, color: kWhite),
      iconInactive: Icon(Icons.book_outlined, color: kBlack.withOpacity(.4)),
      itemLabel: "Class works",
      destination: const ClassWorksScreen(),
    ),
    NavItem(
      iconActive: Icon(Icons.school, color: kWhite),
      iconInactive: Icon(
        Icons.school_outlined,
        color: kBlack.withOpacity(.4),
        size: 28,
      ),
      itemLabel: "Academic",
      destination: const AcademicScreen(),
    ),
    NavItem(
      iconActive: Icon(Icons.home, color: kWhite),
      iconInactive: Icon(
        Icons.home_outlined,
        color: kBlack.withOpacity(.4),
        size: 28,
      ),
      itemLabel: "Dashboard",
      destination: const DashboardScreen(),
    ),
    NavItem(
      iconActive: Icon(Icons.folder, color: kWhite),
      iconInactive: Icon(
        Icons.folder_outlined,
        color: kBlack.withOpacity(.4),
        size: 28,
      ),
      itemLabel: "Back Office",
      destination: const BackOfficeScreen(),
    ),
    NavItem(
      iconActive: Icon(Icons.monetization_on, color: kWhite),
      iconInactive:
          Icon(Icons.monetization_on_outlined, color: kBlack.withOpacity(.4), size: 27,),
      itemLabel: "Finance",
      destination: const FinanceScreen(),
    ),
  ];
}
