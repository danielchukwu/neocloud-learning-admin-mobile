import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/core/utils/utils.dart';

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
            highlightColor: getColorOpposite(Theme.of(context).canvasColor),
            splashColor: Theme.of(context).canvasColor.withOpacity(.5),
            radius: appsSplashRadius,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
              child: Column(
                children: <Widget>[
                  // Title
                  TextLarge(
                    title: navItems[index] + "s",
                    weight: FontWeight.w500,
                    color: index == selectedIndex ? Theme.of(context).canvasColor.withOpacity(.9) : Theme.of(context).canvasColor.withOpacity(.5),
                  ),
                  // Selector
                  const SizedBox(height: 10),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 100),
                    curve: Curves.easeIn,
                    height: 4,
                    width: 40,
                    color: index == selectedIndex
                        ? Theme.of(context).canvasColor.withOpacity(.5)
                        : Colors.transparent,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
    // dead code removed
  }
}
