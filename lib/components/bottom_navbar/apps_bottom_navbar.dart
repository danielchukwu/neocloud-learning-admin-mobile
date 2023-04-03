import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/controllers/NavItem.dart';
import 'package:provider/provider.dart';

class AppsBottomNavBar extends StatelessWidget {
  const AppsBottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<NavItems>(
      builder: (context, navItems, child) =>
          AnimatedNotchBottomBar(
            color: kWhite,
            showLabel: false,
            notchColor: kBlue,
            onTap: (int value) {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => navItems.items[value].destination,));
              navItems.changeNavIndex(value);
            },
            pageController: PageController(
                initialPage: navItems.getSelectedIndex()),
            bottomBarItems: List.generate(navItems.items.length, (index) {
              NavItem item = navItems.items[index];
              return BottomBarItem(
                activeItem: item.iconActive,
                inActiveItem: item.iconInactive,
                itemLabel: item.itemLabel,
              );
            }),
          ),
    );
  }
}