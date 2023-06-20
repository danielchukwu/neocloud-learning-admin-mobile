import 'package:flutter/material.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/Students.dart';
import 'package:neocloud_mobile/screens/dashboard/components/list_user_activity_tile.dart';
import 'package:neocloud_mobile/screens/dashboard/components/personel_navbar.dart';

class PersonelDashboard extends StatefulWidget {
  const PersonelDashboard({
    super.key,
  });

  @override
  State<PersonelDashboard> createState() => _PersonelDashboardState();
}

class _PersonelDashboardState extends State<PersonelDashboard> {
  int selectedNavIndex = 0;
  List<String> navItems = ["Admin", "Educator", "Student"];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Navbar - Admins  Educators  Hods  Students
            PersonelNavBar(
              navItems: navItems,
              selectedIndex: selectedNavIndex,
              press: (index) => setState(() {
                selectedNavIndex = index;
              }),
            ),

            // Personel List - Display based on selectedNavBarItem
            SizedBox(height: defaultSize * 2),
            Container(
              constraints: BoxConstraints(minHeight: defaultSize * 27),
              padding: screenPadding,
              decoration: BoxDecoration(border: Border(bottom: appsBorder)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Admins - 0
                  selectedNavIndex == 0
                      ? ListUserActivityTile(users: getFilteredUsersList(0))
                      : const SizedBox(),
                  // Educators - 1
                  selectedNavIndex == 1
                      ? ListUserActivityTile(users: getFilteredUsersList(1))
                      : const SizedBox(),
                  // Hods - 2
                  selectedNavIndex == 2
                      ? ListUserActivityTile(users: getFilteredUsersList(2))
                      : const SizedBox(),
                ],
              ),
            )
          ],
        )
      ],
    );
  }

  getFilteredUsersList(int i) {
    return users.where((element) {
      return element.role.contains(navItems[i]);
    }).toList();
  }
}
