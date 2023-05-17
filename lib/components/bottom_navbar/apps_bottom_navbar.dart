import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
      builder: (context, navItems, child) => Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: kBlack.withOpacity(.5), width: .2),
          ),
        ),
        child: Row(
          children: List.generate(navItems.items.length, (index) {
            NavItem item = navItems.items[index];
            return Expanded(
              child: InkWell(
                onTap: () {
                  if (index != navItems.getSelectedIndex()) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => navItems.items[index].destination,
                        ));
                    navItems.changeNavIndex(index);
                  }
                },
                highlightColor: kWhite,
                splashColor: appsSplashColor,
                radius: appsSplashRadius,
                child: Container(
                  padding: EdgeInsets.only(
                    top: defaultSize,
                    bottom: defaultSize * 2.4,
                  ),
                  child: SvgPicture.asset(
                    navItems.getSelectedIndex() == index
                        ? item.svgActive
                        : item.svgInactive,
                    color: navItems.getSelectedIndex() == index
                        ? kBlue
                        : kBlack50,
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
  //   return Consumer<NavItems>(
  //     builder: (context, navItems, child) =>
  //         AnimatedNotchBottomBar(
  //           color: Color(0xFFF9F9F9),
  //           showLabel: false,
  //           notchColor: kBlue,
  //           onTap: (int value) {
  //             Navigator.pushReplacement(context, MaterialPageRoute(
  //               builder: (context) => navItems.items[value].destination,));
  //             navItems.changeNavIndex(value);
  //           },
  //           pageController: PageController(
  //               initialPage: navItems.getSelectedIndex()),
  //           bottomBarItems: List.generate(navItems.items.length, (index) {
  //             NavItem item = navItems.items[index];
  //             return BottomBarItem(
  //               activeItem: item.iconActive,
  //               inActiveItem: item.iconInactive,
  //               itemLabel: item.itemLabel,
  //             );
  //           }),
  //         ),
  //   );
  // }
}
