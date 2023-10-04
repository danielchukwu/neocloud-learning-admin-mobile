import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/core/utils/utils.dart';
import 'package:neocloud_mobile/providers/NavItem.dart';
import 'package:provider/provider.dart';

class AppsBottomNavBar extends StatelessWidget {
  const AppsBottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<NavbarProvider>(
      builder: (context, navItems, child) => Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: Theme.of(context).canvasColor.withOpacity(.5), width: .2),
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
                highlightColor: getColorOpposite(Theme.of(context).canvasColor),
                splashColor: Theme.of(context).canvasColor,
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
                        : Theme.of(context).canvasColor.withOpacity(.5),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
