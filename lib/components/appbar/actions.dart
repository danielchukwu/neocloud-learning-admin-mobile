import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/images.dart';
import 'package:neocloud_mobile/constraints.dart';

class actionUserButton extends StatelessWidget {
  const actionUserButton({
    super.key,
    this.icon,
    this.svg,
    this.isDark = false,
    required this.routeName,
  });

  // either <svg> or <icon> is required for in other for something
  // to be displayed
  final IconData? icon;
  final String? svg;
  // action button is dark when this <isDark> is true and white when <isDark>
  // is false
  final bool isDark;
  // the route to be navigated to when this action button is clicked on
  final String routeName;
  // final Function(BuildContext context) press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => navigateToScreen(context: context, routeName: routeName),
        child: Container(
          color: Colors.transparent,
          padding: EdgeInsets.symmetric(horizontal: defaultSize * 2),
          child: svg != null
            ? IconOrSvg(svg: svg!, color: isDark ? kBlack80 : kWhite, size: defaultSize * 2.5,)
            : IconOrSvg(icon: icon!, color: isDark ? kBlack80 : kWhite, size: defaultSize * 2.5),
        )
    );
  }
}