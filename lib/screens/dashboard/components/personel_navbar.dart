import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';

class PersonelNavBar extends StatelessWidget {
  const PersonelNavBar({
    super.key,
    required this.navItems,
    required this.selectedIndex,
    required this.press,
  });

  final List<String> navItems;
  final int selectedIndex;
  final Function(int num) press;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: appsBorder),
      ),
      child: Row(
        children: List<Widget>.generate(
          navItems.length,
          (index) => InkWell(
            onTap: () => press(index),
            highlightColor: kWhite,
            splashColor: appsSplashColor,
            radius: appsSplashRadius,
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                  defaultSize * 2, defaultSize * 1.5, defaultSize * 2, 0),
              child: Column(
                children: <Widget>[
                  // Title
                  TextLarge(
                    title: navItems[index] + "s",
                    weight: FontWeight.w500,
                    color: index == selectedIndex ? kBlack90 : kBlack50,
                  ),
                  // Selector
                  SizedBox(height: defaultSize * 1),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 100),
                    curve: Curves.easeIn,
                    height: defaultSize * .4,
                    width: defaultSize * 4,
                    color: index == selectedIndex
                        ? kBlack.withOpacity(.5)
                        : Colors.transparent,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
    ;
  }
}
