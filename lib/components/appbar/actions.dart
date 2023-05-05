import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/images.dart';
import 'package:neocloud_mobile/constraints.dart';

class actionUserButton extends StatelessWidget {
  const actionUserButton({
    required this.routeName, 
    super.key,
    this.icon,
    this.svg,
    this.isDark = false,
    this.routeWidget,
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
  // 
  final Widget? routeWidget;
  

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          if (routeName.length == 0 && routeWidget != null){
            // Push
            return navigateToScreenPush(context: context, widget: routeWidget!);
          }
          navigateToScreen(context: context, routeName: routeName);
        },
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